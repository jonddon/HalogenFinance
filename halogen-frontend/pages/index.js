import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>Halogen Finance</title>
        <meta name="description" content="Halogen Finance Home page" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main className={styles.main}>
        <div>
        Main Content
        </div>
      </main>
    </div>
  )
}
