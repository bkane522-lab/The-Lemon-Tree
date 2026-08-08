import type { Metadata } from "next";
import { brand } from "@/config/brand";
import { PwaRegister } from "@/components/PwaRegister";

export const metadata: Metadata = {
  title: {
    default: `${brand.name} — ${brand.tagline}`,
    template: `%s — ${brand.name}`,
  },
  description: brand.tagline,
  icons: {
    icon: brand.logo.favicon,
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr">
      <body>
        <PwaRegister />
        {children}
      </body>
    </html>
  );
}
