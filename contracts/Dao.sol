// SPDX-License-Identifier: GPL-3.0;
pragma solidity ^0.8.0;
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
contract Dao {
    // Global Variables
    address nativeToken;
    // uint public totalTokenByMembers;
    uint public votingDuration;
    uint requiredAmountOfToken;
    // should be fixed
    uint public maxFundingDuration;
    // Proposals
    struct ProjectProposal {
        address projectOwner;
        // address projectWallet;
        string projectName;
        string projectDescription;
        uint createdAt;
        uint yesVotes;
        uint noVotes;
        ProposalVotingState proposalVotingState;
        mapping(address => Vote) votesByMember;
        mapping(address => uint) contributor;
        address[] contributors;
    }
    enum ProposalVotingState{
            REJECTED,
            ONGOING,
            APPROVED
    }
    uint projectId;
    ProjectProposal[] ProjectProposals;
    mapping(uint => ProjectProposal) public project_Proposal;
    // DAO Members will be added by admin
    struct DaoMember{
        address member;
        uint votingPower;
        bool exists;
    }
    mapping(address => DaoMember) public DaoMembers;
    DaoMember[] allDaoMembers;
    // Votes
    // require that only approved proposal
    enum Vote { Null, No, Yes }
    // enum Payment { Start, Ongoing, Closed } // platform
    
    // constructor
    address admin;
    event Result(uint projectId, ProposalVotingState result, uint yesVotes, uint noVotes);
    event NewMember(address member_, string message);
    event SubmittedProjectProposal(string projectName);
    event Votes(uint projectId_, uint yesVotes, uint noVotes);
    
    constructor (address _admin, address _token) {
        require(_admin != address(0), 'Only Admin can call this function');
        votingDuration = 7 days;
        maxFundingDuration = 30 days;
        admin = _admin;
        nativeToken = _token;
    }
    modifier onlyAdmin(){
        require(msg.sender == admin, 'Only Admin can call this function');
        _;
    }
    modifier onlyDaoMember(){
        require(DaoMembers[msg.sender].votingPower > 0, "not a member");
        _;
    }
    function addDaoMember(address _member, uint _votingPower) public onlyAdmin returns(bool){
        DaoMember storage _daoMember = DaoMembers[_member];
        _daoMember.member =_member;
         _daoMember.votingPower = _votingPower;
         _daoMember.exists =  true;
        allDaoMembers.push(_daoMember);
        emit NewMember(_member, 'was Added');
        return true;
    }
    // function removeDaoMember(address _member) public onlyAdmin{
    //     delete DaoMembers[_member];
    // }
    // PROPOSAL FUNCTIONS
    function SubmitProjectProposal(address _projectOwner, string memory _projectName,string memory _projectDescription) public {
        IERC20 token = IERC20(nativeToken);
        require (token.balanceOf(_projectOwner) >= 1000, "HGN: Insufficient token to submit proposal");
        require (_projectOwner != address(0), "Owner's address cannot be address zero");
        ProjectProposal storage project =  project_Proposal[projectId];
        project.projectOwner = _projectOwner;
        project.projectName = _projectName;
        project.projectDescription = _projectDescription;
        project.proposalVotingState = ProposalVotingState.ONGOING;
        project.createdAt = block.timestamp;
        projectId++;
        emit SubmittedProjectProposal(_projectName);
    }
    function vote(uint _projectId, uint8 votingChoice) public onlyDaoMember {
        require (_projectId < projectId);
        ProjectProposal storage project =  project_Proposal[_projectId];
        require (project.proposalVotingState == ProposalVotingState.ONGOING);
        require (block.timestamp <= (project.createdAt + votingDuration), 'Voting closed');
        require (project.votesByMember[msg.sender] == Vote.Null, 'Already voted');
        require (votingChoice < 3,'Invalid Selection');
        Vote vote_ = Vote(votingChoice);
        DaoMember memory _daoMember = DaoMembers[msg.sender];
        if (vote_ == Vote.Yes) {
            project.yesVotes += _daoMember.votingPower;
            project.votesByMember[msg.sender] = Vote.Yes;
        }
        if (vote_ == Vote.No) {
            project.noVotes += _daoMember.votingPower;
            project.votesByMember[msg.sender] = Vote.No;
        }
        emit Votes(_projectId, project.yesVotes, project.noVotes);
    }
    
    function updateVotingState(uint projectId_) public {
        require (projectId_ < projectId);
        ProjectProposal storage project =  project_Proposal[projectId_];
        require (block.timestamp >= (project.createdAt + votingDuration), 'Voting is ongoing');
        if (project.yesVotes > project.noVotes) {
            project.proposalVotingState = ProposalVotingState.APPROVED;
        } else {
            project.proposalVotingState = ProposalVotingState.REJECTED;
        }
        emit Result(projectId_, project.proposalVotingState, project.yesVotes, project.noVotes);
    }
}