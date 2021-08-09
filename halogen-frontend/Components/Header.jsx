import React from 'react'
import Link from 'next/link'
import headerStyles from '../styles/Header.module.css'

export default function Header() {
    return (
        <header className={headerStyles.header}>
  <span href="" className={headerStyles.logo}>Halogen Finance</span>
  <input className={headerStyles.menuBtn} type="checkbox" id="menu-btn" />
  <label className={headerStyles.menuIcon} for="menu-btn"><span className="navicon"></span></label>
  <ul className={headerStyles.menu}>
    <li><a href ='#' >Connect Wallet</a></li>
    <li><Link href="/projects">Projects</Link></li>
    <li><a href="#">Staking</a></li>
  </ul>
</header>

    )
}
