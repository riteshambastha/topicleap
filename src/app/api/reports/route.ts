import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { getCurrentChild } from "@/lib/auth";

/** A kid flags a question that looks wrong, with an optional short note. */
export async function POST(req: Request) {
  const child = await getCurrentChild();
  if (!child) {
    return NextResponse.json(
      { error: "You must be signed in as a learner." },
      { status: 401 },
    );
  }

  let body: { questionId?: string; worksheetId?: string; message?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid request body." }, { status: 400 });
  }

  if (!body.questionId) {
    return NextResponse.json({ error: "Missing question." }, { status: 400 });
  }
  const message = (body.message ?? "").trim().slice(0, 500);

  const admin = createAdminClient();
  const { error } = await admin.from("question_reports").insert({
    child_id: child.id,
    question_id: body.questionId,
    worksheet_id: body.worksheetId ?? null,
    message: message || null,
  });
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 400 });
  }
  return NextResponse.json({ ok: true });
}
