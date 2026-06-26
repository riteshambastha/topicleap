import { AppFooter } from "@/components/app-footer";

export default function ParentLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="flex min-h-screen flex-1 flex-col">
      {children}
      <AppFooter />
    </div>
  );
}
