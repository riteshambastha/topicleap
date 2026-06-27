import { requireAdmin } from "@/lib/admin-auth";
import { getAdminData } from "@/lib/admin-data";
import { AdminDashboard } from "@/components/admin-dashboard";

// Always render fresh data; never cache the admin view.
export const dynamic = "force-dynamic";

export default async function AdminPage() {
  await requireAdmin();
  const data = await getAdminData();
  return <AdminDashboard data={data} />;
}
