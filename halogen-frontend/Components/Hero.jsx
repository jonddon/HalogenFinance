import React from 'react'
import HeroStyles from '../styles/Hero.module.css'
import Image from 'next/image'
import profilePic from '../public/fund.jpg'

export default function Hero() {
    return (
        <div className={HeroStyles.heroDiv}>
         <div className={HeroStyles.textSection}><h1>Fund Your Projects, Fund   Your &nbsp; 
             <span className={HeroStyles.cryptoDream}>
             Crypto Dream

             </span>
             </h1>
         <p>Getting Funding for your project do not need to be hard and full of hassles,
             we are one of the fastest growing ido platform in africa.
         </p>
         </div>

         <div className={HeroStyles.btnSection}>
             <div>
                 <button className={`${HeroStyles.btn} ${HeroStyles.getStarted}`}>Get Started</button>
             </div>
             <div>
                 <button className={`${HeroStyles.btn} ${HeroStyles.upcomingBtn}`}>
                 Get notfied of upcoming idos

                 </button>
                 </div>
         </div>
        </div>
    )
}
