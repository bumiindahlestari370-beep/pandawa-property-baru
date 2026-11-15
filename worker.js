export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const response = await env.ASSETS.fetch(request);

    if (url.pathname === "/sitemap.xml") {
      const headers = new Headers(response.headers);
      headers.set("Content-Type", "application/xml; charset=utf-8");
      headers.set("X-Robots-Tag", "all");
      headers.set("Cache-Control", "public, max-age=3600");
      return new Response(response.body, { status: response.status, headers });
    }

    if (url.pathname === "/robots.txt") {
      const headers = new Headers(response.headers);
      headers.set("Content-Type", "text/plain; charset=utf-8");
      headers.set("Cache-Control", "public, max-age=3600");
      return new Response(response.body, { status: response.status, headers });
    }

    return response;
  },
};
