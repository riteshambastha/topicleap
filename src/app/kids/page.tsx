"use client";

import { useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export default function KidLoginPage() {
  const router = useRouter();
  const [username, setUsername] = useState("");
  const [pin, setPin] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setLoading(true);
    const email = `${username.trim().toLowerCase()}@kids.topicleap.com`;
    const { error } = await createClient().auth.signInWithPassword({
      email,
      password: pin.trim(),
    });
    setLoading(false);
    if (error) {
      setError("Hmm, that username or PIN didn't work. Try again!");
      return;
    }
    router.push("/learn");
    router.refresh();
  }

  return (
    <main className="flex flex-1 items-center justify-center p-6">
      <Card className="w-full max-w-md">
        <CardHeader>
          <CardTitle>👋 Welcome back!</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={onSubmit} className="grid gap-4">
            <div className="grid gap-1.5">
              <Label htmlFor="username">Username</Label>
              <Input
                id="username"
                autoCapitalize="none"
                autoComplete="username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
              />
            </div>
            <div className="grid gap-1.5">
              <Label htmlFor="pin">PIN</Label>
              <Input
                id="pin"
                type="password"
                inputMode="numeric"
                autoComplete="off"
                value={pin}
                onChange={(e) => setPin(e.target.value)}
                required
              />
            </div>
            {error && <p className="text-sm text-red-600">{error}</p>}
            <Button type="submit" size="lg" disabled={loading}>
              {loading ? "Let&apos;s go…" : "Start learning"}
            </Button>
          </form>
          <p className="mt-4 text-center text-sm text-slate-500">
            <Link href="/login" className="hover:underline">
              Parent login →
            </Link>
          </p>
        </CardContent>
      </Card>
    </main>
  );
}
