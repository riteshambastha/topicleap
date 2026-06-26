/**
 * TopicLeap logo — uses the official brand mark (extracted from the brand
 * asset suite, stored in /public/brand). `LogoIcon` is the standalone mark;
 * `Logo` is mark + "TopicLeap" wordmark.
 *
 * `tone="dark"` swaps to the white mark + white wordmark for dark backgrounds.
 */
import Image from "next/image";

export function LogoIcon({
  className = "h-8 w-8",
  tone = "light",
}: {
  className?: string;
  tone?: "light" | "dark";
}) {
  const src =
    tone === "dark" ? "/brand/logo-mark-white.png" : "/brand/logo-mark.png";
  return (
    <Image
      src={src}
      alt="TopicLeap"
      width={304}
      height={304}
      priority
      className={className}
      style={{ objectFit: "contain" }}
    />
  );
}

export function Logo({
  className = "",
  iconClass = "h-8 w-8",
  textClass = "text-xl",
  tone = "light",
}: {
  className?: string;
  iconClass?: string;
  textClass?: string;
  tone?: "light" | "dark";
}) {
  return (
    <span className={`inline-flex items-center gap-2 ${className}`}>
      <LogoIcon className={iconClass} tone={tone} />
      <span
        className={`font-display font-extrabold tracking-tight ${textClass}`}
      >
        {tone === "dark" ? (
          <span className="text-white">TopicLeap</span>
        ) : (
          <>
            <span className="text-indigo-800">Topic</span>
            <span className="text-fuchsia-600">Leap</span>
          </>
        )}
      </span>
    </span>
  );
}
