"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { GradePicker } from "@/components/grade-picker";

export function AddChildForm() {
  const router = useRouter();
  const [displayName, setDisplayName] = useState("");
  const [username, setUsername] = useState("");
  const [pin, setPin] = useState("");
  const [gradeLevel, setGradeLevel] = useState(4);
  const [error, setError] = useState<string | null>(null);
  const [ok, setOk] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setOk(null);
    setLoading(true);
    const res = await fetch("/api/children", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ displayName, username, pin, gradeLevel }),
    });
    const data = await res.json();
    setLoading(false);
    if (!res.ok) {
      setError(data.error ?? "Could not create child login.");
      return;
    }
    setOk(`Created login for @${data.username}. They can sign in now.`);
    setDisplayName("");
    setUsername("");
    setPin("");
    setGradeLevel(4);
    router.refresh();
  }

  return (
    <form onSubmit={onSubmit} className="grid gap-4">
      <div className="grid gap-1.5">
        <Label htmlFor="c-name">Child&apos;s name</Label>
        <Input
          id="c-name"
          value={displayName}
          onChange={(e) => setDisplayName(e.target.value)}
          placeholder="e.g. Maya"
          required
        />
      </div>
      <div className="grid gap-1.5">
        <Label htmlFor="c-username">Username</Label>
        <Input
          id="c-username"
          value={username}
          autoCapitalize="none"
          onChange={(e) => setUsername(e.target.value)}
          placeholder="3–20 letters/numbers"
          required
        />
      </div>
      <div className="grid gap-1.5">
        <Label>Grade</Label>
        <GradePicker value={gradeLevel} onChange={setGradeLevel} />
        <p className="text-xs text-slate-500">
          Kindergarten, Grade 3, and Grade 4 have content today; more grades are
          coming soon.
        </p>
      </div>
      <div className="grid gap-1.5">
        <Label htmlFor="c-pin">PIN (4–6 digits)</Label>
        <Input
          id="c-pin"
          inputMode="numeric"
          value={pin}
          onChange={(e) => setPin(e.target.value)}
          placeholder="e.g. 1234"
          required
        />
      </div>
      {error && <p className="text-sm text-red-600">{error}</p>}
      {ok && <p className="text-sm text-emerald-600">{ok}</p>}
      <Button type="submit" disabled={loading}>
        {loading ? "Creating…" : "Create child login"}
      </Button>
    </form>
  );
}
