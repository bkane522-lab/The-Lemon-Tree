import type { Metadata } from 'next';
import './globals.css';
import { Header } from '@/components/Header';
import { Footer } from '@/components/Footer';
import { brand } from '@/config/brand';
import { PwaRegister } from '@/components/PwaRegister';
export const metadata: Metadata = { title: {default: `${brand.brandName} — ${brand.brandTagline}`, template: `%s — ${brand.brandName}`}, description: brand.heroText, icons:{icon:brand.faviconPath} };
export default function RootLayout({children}:{children:React.ReactNode}){return <html lang="fr"><body><PwaRegister/><Header/>{children}<Footer/></body></html>}
