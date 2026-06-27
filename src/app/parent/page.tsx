import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentParent } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { AddChildForm } from "@/components/add-child-form";
import { LogoutButton } from "@/components/logout-button";
import { gradeLabel } from "@/lib/grade-label";
import { Logo } from "@/components/logo";
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
      <header className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-200 bg-white px-4 py-4 sm:px-6">
        <span className="flex items-center gap-2">
          <Logo iconClass="h-7 w-7" textClass="text-lg" />
          <span className="text-sm font-semibold text-slate-400">· Parent</span>
        </span>
        <div className="flex items-center gap-3">
          <span className="hidden text-sm text-slate-500 sm:inline">
            {parent.email}
          </span>
          <Link
            href="/parent/refer"
            className="rounded-xl bg-gradient-to-r from-fuchsia-600 to-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm transition hover:opacity-90"
          >
            🎁 Invite friends
          </Link>
          <LogoutButton />
        </div>
      </header>

      <main className="mx-auto grid w-full max-w-5xl flex-1 gap-6 p-4 sm:p-6 lg:grid-cols-5">
        <Card className="h-fit lg:col-span-3">
          <CardHeader>
            <CardTitle>Your learners</CardTitle>
          </CardHeader>
          <CardContent>
            {children && children.length > 0 ? (
              <ul className="grid gap-3">
                {children.map((c) => (
                  <li key={c.id}>
                    <Link
                      href={`/parent/child/${c.id}`}
                      className="flex items-center justify-between rounded-xl border border-slate-200 px-4 py-3 transition hover:border-indigo-400 hover:bg-indigo-50"
                    >
                      <div className="flex items-center gap-3">
                        <span className="flex h-11 w-11 items-center justify-center rounded-xl bg-indigo-100 text-2xl">
                          🎒
                        </span>
                        <div>
                          <p className="font-semibold">{c.display_name}</p>
                          <p className="text-sm text-slate-500">
                            @{c.username} · {gradeLabel(c.grade_level)}
                          </p>
                        </div>
                      </div>
                      <span className="text-sm font-semibold text-indigo-600">
                        View report →
                      </span>
                    </Link>
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

        <Card className="h-fit lg:col-span-2">
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
