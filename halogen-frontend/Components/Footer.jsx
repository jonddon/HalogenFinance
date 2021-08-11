import React from 'react'
import {  FaRegEnvelope, FaTwitter } from 'react-icons/fa';
import footerStyles from '../styles/Footer.module.css'


export default function Footer() {
    return (
        <>
{/*  FOOTER START */}
<div className={footerStyles.footer}>
  <div className={footerStyles.innerFooter}>
    {/*  for company name and description */}
    <div className={footerStyles.footerItems}>
      <h1>Halogen Finance</h1>
      <span>The LaunchPad for African Blockchain startup</span>
    </div>
    {/*  for quick links  */}
    <div className={footerStyles.footerItems}>
      <h3>Socials</h3>
      <div className={footerStyles.border1} /> {/*for the underline */}
      <ul className={footerStyles.ul}>
        <a href="#"><li> Twitter</li></a>
        <a href="#"><li> Github</li></a>
        <a href="#"><li> Telegram</li></a>
      </ul>
    </div>
    {/*  for some other links */}
    <div className={footerStyles.footerItems}>
      <h3>Company</h3>
      <div className={footerStyles.border1} />  {/*for the underline */}
      <ul className={footerStyles.ul}>
        <a href="#"><li>About us</li></a>
        <a href="#"><li>Apply for Ido</li></a>
      </ul>
    </div>
    {/*  for contact us info */}
    <div className={footerStyles.footerItems}>
      <h3>Contact us</h3>
      <div className={footerStyles.border1} />
      <ul className ={footerStyles.ul}>
        <li > <FaRegEnvelope className={footerStyles.svg} />contact@halogen.com</li>
      </ul> 
    </div>
  </div>
  {/*   Footer Bottom start  */}
  <div className={footerStyles.footerBottom}>
    Copyright © Halogen {new Date().getFullYear()}.
  </div>
</div>
{/*   Footer Bottom end */}
{/*   FOOTER END */}

        </>
     )
}
