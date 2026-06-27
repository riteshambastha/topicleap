"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export default function ParentSignupPage() {
  const router = useRouter();
  const [displayName, setDisplayName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [ref, setRef] = useState<string | null>(null);

  // Capture an invite code from ?ref= (or a previously-stored cookie) and
  // remember it for 30 days so it survives navigation before signup.
  useEffect(() => {
    const fromUrl = new URLSearchParams(window.location.search).get("ref");
    const fromCookie = document.cookie
      .split("; ")
      .find((c) => c.startsWith("tl_ref="))
      ?.split("=")[1];
    const code = (fromUrl || fromCookie || "").toUpperCase().trim();
    if (code) {
      setRef(code);
      document.cookie = `tl_ref=${code}; path=/; max-age=${60 * 60 * 24 * 30}; samesite=lax`;
    }
  }, []);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setLoading(true);

    const res = await fetch("/api/parent/signup", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email, password, displayName, ref }),
    });
    const data = await res.json();
    if (!res.ok) {
      setLoading(false);
      setError(data.error ?? "Could not create account.");
      return;
    }

    // Sign in immediately after creating the account.
    const { error: signInErr } = await createClient().auth.signInWithPassword({
      email: email.trim().toLowerCase(),
      password,
    });
    setLoading(false);
    if (signInErr) {
      setError(signInErr.message);
      return;
    }
    router.push("/parent");
    router.refresh();
  }

  return (
    <main className="flex flex-1 items-center justify-center p-6">
      <Card className="w-full max-w-md">
        <CardHeader>
          <CardTitle>Create a parent account</CardTitle>
        </CardHeader>
        <CardContent>
          {ref && (
            <div className="mb-4 rounded-xl bg-fuchsia-50 px-4 py-3 text-sm font-medium text-fuchsia-700 ring-1 ring-fuchsia-100">
              🎁 You were invited by a friend! Add a learner after signing up
              and you&apos;ll both earn bonus points.
            </div>
          )}
          <form onSubmit={onSubmit} className="grid gap-4">
            <div className="grid gap-1.5">
              <Label htmlFor="name">Your name</Label>
              <Input
                id="name"
                value={displayName}
                onChange={(e) => setDisplayName(e.target.value)}
                required
              />
            </div>
            <div className="grid gap-1.5">
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                type="email"
                autoComplete="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>
            <div className="grid gap-1.5">
              <Label htmlFor="password">Password</Label>
              <Input
                id="password"
                type="password"
                autoComplete="new-password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                minLength={6}
                required
              />
              <p className="text-xs text-slate-500">At least 6 characters.</p>
            </div>
            {error && <p className="text-sm text-red-600">{error}</p>}
            <Button type="submit" disabled={loading}>
              {loading ? "Creating…" : "Create account"}
            </Button>
          </form>
          <p className="mt-4 text-center text-sm text-slate-600">
            Already have an account?{" "}
            <Link href="/login" className="font-semibold text-indigo-600">
              Sign in
            </Link>
          </p>
        </CardContent>
      </Card>
    </main>
  );
}
