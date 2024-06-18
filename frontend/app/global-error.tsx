"use client";

import * as Sentry from "@sentry/nextjs";
import Error from "next/error";
import { useEffect } from "react";

// Define the type for the error prop and statusCode
interface GlobalErrorProps {
  error: Error;
  statusCode: number;
}

export default function GlobalError({ error, statusCode }: GlobalErrorProps) {
  useEffect(() => {
    Sentry.captureException(error);
  }, [error]);

  return (
    <html>
      <body>
        <Error statusCode={statusCode} />
      </body>
    </html>
  );
}
