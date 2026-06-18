import { redirect } from "next/navigation";
import { getCurrentParent } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { AddChildForm } from "@/components/add-child-form";
import { LogoutButton } from "@/components/logout-button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

export default async function ParentDashboard() {
  const parent = await getCurrentParent();
  if (!parent) redirect("/login");

  const supabase = await createClient();
  const { data: children } = await supabase
    .from("children")
    .select("id, username, display_name, grade_level")
    .order("created_at");

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex items-center justify-between border-b border-slate-200 bg-white px-6 py-4">
        <span className="font-bold text-indigo-700">TopicLeap · Parent</span>
        <div className="flex items-center gap-3">
          <span className="text-sm text-slate-500">{parent.email}</span>
          <LogoutButton />
        </div>
      </header>

      <main className="mx-auto grid w-full max-w-3xl gap-6 p-6 md:grid-cols-2">
        <Card className="h-fit">
          <CardHeader>
            <CardTitle>Your learners</CardTitle>
          </CardHeader>
          <CardContent>
            {children && children.length > 0 ? (
              <ul className="grid gap-3">
                {children.map((c) => (
                  <li
                    key={c.id}
                    className="flex items-center justify-between rounded-xl border border-slate-200 px-4 py-3"
                  >
                    <div>
                      <p className="font-semibold">{c.display_name}</p>
                      <p className="text-sm text-slate-500">
                        @{c.username} · Grade {c.grade_level}
                      </p>
                    </div>
                    <span className="text-2xl">🎒</span>
                  </li>
                ))}
              </ul>
            ) : (
              <p className="text-sm text-slate-500">
                No learners yet. Create one to get started.
              </p>
            )}
          </CardContent>
        </Card>

        <Card className="h-fit">
          <CardHeader>
            <CardTitle>Add a learner</CardTitle>
          </CardHeader>
          <CardContent>
            <AddChildForm />
          </CardContent>
        </Card>
      </main>
    </div>
  );
}
