import type { Metadata } from "next";
import "./globals.css";

import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";
import { PwaRegister } from "@/components/PwaRegister";
import { brand } from "@/config/brand";

export const metadata: Metadata = {
  title: {
    default: `${brand.name} — ${brand.tagline}`,
    template: `%s — ${brand.name}`,
  },

  description:
    "Décoration et aménagement intérieur sur mesure. Des espaces élégants, chaleureux et pensés pour votre quotidien.",

  applicationName: brand.name,

  manifest: "/manifest.webmanifest",

  icons: {
    icon: brand.logo.favicon,
    apple: brand.logo.appleTouchIcon,
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="fr">
      <body>
        <PwaRegister />
        <Header />
        {children}
        <Footer />
      </body>
    </html>
  );
}
