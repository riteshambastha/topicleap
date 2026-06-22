/**
 * TopicLeap logo — recreated as vector so it's crisp and transparent
 * everywhere. `LogoIcon` is the standalone mark; `Logo` is mark + wordmark.
 */

export function LogoIcon({ className = "h-8 w-8" }: { className?: string }) {
  return (
    <svg
      viewBox="0 0 96 96"
      className={className}
      role="img"
      aria-label="TopicLeap"
    >
      <defs>
        <linearGradient id="tl-logo-grad" x1="0" y1="1" x2="1" y2="0">
          <stop offset="0" stopColor="#4338ca" />
          <stop offset="0.55" stopColor="#7c3aed" />
          <stop offset="1" stopColor="#db2777" />
        </linearGradient>
      </defs>
      {/* T top bar */}
      <rect x="12" y="20" width="40" height="14" rx="7" fill="url(#tl-logo-grad)" />
      {/* T stem with a 'leap' hook at the bottom */}
      <path
        d="M37 27 V58 a13 13 0 0 1 -26 0"
        stroke="url(#tl-logo-grad)"
        strokeWidth="14"
        strokeLinecap="round"
        fill="none"
      />
      {/* upward arrow shaft */}
      <path
        d="M40 62 L72 30"
        stroke="url(#tl-logo-grad)"
        strokeWidth="14"
        strokeLinecap="round"
        fill="none"
      />
      {/* arrowhead pointing up-right */}
      <path d="M58 22 L82 18 L78 44 Z" fill="url(#tl-logo-grad)" />
    </svg>
  );
}

export function Logo({
  className = "",
  iconClass = "h-8 w-8",
  textClass = "text-xl",
}: {
  className?: string;
  iconClass?: string;
  textClass?: string;
}) {
  return (
    <span className={`inline-flex items-center gap-2 ${className}`}>
      <LogoIcon className={iconClass} />
      <span
        className={`font-display font-extrabold tracking-tight bg-gradient-to-r from-indigo-700 via-violet-600 to-fuchsia-600 bg-clip-text text-transparent ${textClass}`}
      >
        TopicLeap
      </span>
    </span>
  );
}
