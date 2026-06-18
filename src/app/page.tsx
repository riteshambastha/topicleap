import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentChild, getCurrentParent } from "@/lib/auth";
import { Card, CardContent } from "@/components/ui/card";

export default async function Home() {
  // Send already-signed-in users straight to their home.
  if (await getCurrentChild()) redirect("/learn");
  if (await getCurrentParent()) redirect("/parent");

  return (
    <main className="flex flex-1 items-center justify-center p-6">
      <div className="w-full max-w-md text-center">
        <h1 className="mb-2 text-4xl font-extrabold tracking-tight text-indigo-700">
          TopicLeap
        </h1>
        <p className="mb-8 text-slate-600">
          Learn a topic, do the worksheet, earn points.
        </p>
        <div className="grid gap-4">
          <Link href="/kids">
            <Card className="transition hover:border-indigo-400 hover:shadow-md">
              <CardContent className="flex items-center justify-between p-6">
                <span className="text-lg font-bold">🎒 I&apos;m a learner</span>
                <span className="text-slate-400">→</span>
              </CardContent>
            </Card>
          </Link>
          <Link href="/login">
            <Card className="transition hover:border-indigo-400 hover:shadow-md">
              <CardContent className="flex items-center justify-between p-6">
                <span className="text-lg font-bold">👪 I&apos;m a parent</span>
                <span className="text-slate-400">→</span>
              </CardContent>
            </Card>
          </Link>
        </div>
      </div>
    </main>
  );
}
