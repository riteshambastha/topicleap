"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { GradePicker } from "@/components/grade-picker";

export function EditChildForm({
  childId,
  initialDisplayName,
  initialUsername,
  initialGrade,
}: {
  childId: string;
  initialDisplayName: string;
  initialUsername: string;
  initialGrade: number;
}) {
  const router = useRouter();
  const [open, setOpen] = useState(false);
  const [displayName, setDisplayName] = useState(initialDisplayName);
  const [username, setUsername] = useState(initialUsername);
  const [gradeLevel, setGradeLevel] = useState(initialGrade);
  const [pin, setPin] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [ok, setOk] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);
    setOk(null);
    setLoading(true);
    const res = await fetch(`/api/children/${childId}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        displayName,
        username,
        gradeLevel,
        pin: pin.trim() || undefined,
      }),
    });
    const data = await res.json();
    setLoading(false);
    if (!res.ok) {
      setError(data.error ?? "Could not save changes.");
      return;
    }
    setOk("Saved!");
    setPin("");
    router.refresh();
  }

  if (!open) {
    return (
      <Button variant="outline" size="sm" onClick={() => setOpen(true)}>
        ✏️ Edit details
      </Button>
    );
  }

  return (
    <form onSubmit={onSubmit} className="grid gap-4">
      <div className="grid gap-1.5">
        <Label htmlFor="e-name">Name</Label>
        <Input
          id="e-name"
          value={displayName}
          onChange={(e) => setDisplayName(e.target.value)}
          required
        />
      </div>
      <div className="grid gap-1.5">
        <Label htmlFor="e-username">Username</Label>
        <Input
          id="e-username"
          value={username}
          autoCapitalize="none"
          onChange={(e) => setUsername(e.target.value)}
          required
        />
      </div>
      <div className="grid gap-1.5">
        <Label>Grade</Label>
        <GradePicker value={gradeLevel} onChange={setGradeLevel} />
        <p className="text-xs text-slate-500">
          Changing the grade keeps all of {initialDisplayName}&apos;s progress and
          points — it just changes which grade&apos;s topics they see at home.
        </p>
      </div>
      <div className="grid gap-1.5">
        <Label htmlFor="e-pin">New PIN (optional)</Label>
        <Input
          id="e-pin"
          inputMode="numeric"
          value={pin}
          onChange={(e) => setPin(e.target.value)}
          placeholder="Leave blank to keep current PIN"
        />
      </div>
      {error && <p className="text-sm text-red-600">{error}</p>}
      {ok && <p className="text-sm text-emerald-600">{ok}</p>}
      <div className="flex gap-3">
        <Button type="submit" disabled={loading}>
          {loading ? "Saving…" : "Save changes"}
        </Button>
        <Button type="button" variant="ghost" onClick={() => setOpen(false)}>
          Cancel
        </Button>
      </div>
    </form>
  );
}
