<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="id">
            <head>
                <title>XML Sitemap | Adiel Ebert Nakula Sahdiy</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <style>
                    body {
                        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
                        color: #f0f0f0;
                        background-color: #050505;
                        margin: 0;
                        padding: 40px;
                    }
                    a {
                        color: #d4af37;
                        text-decoration: none;
                    }
                    a:hover {
                        text-decoration: underline;
                    }
                    h1 {
                        font-family: 'Times New Roman', serif;
                        font-weight: normal;
                        border-bottom: 2px solid #d4af37;
                        padding-bottom: 10px;
                        margin-bottom: 20px;
                    }
                    p.desc {
                        font-style: italic;
                        color: #b0b0b0;
                        margin-bottom: 40px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        font-size: 14px;
                    }
                    th {
                        text-align: left;
                        border-bottom: 1px solid #333;
                        padding: 15px;
                        color: #d4af37;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }
                    td {
                        padding: 15px;
                        border-bottom: 1px solid #1a1a1a;
                    }
                    tr:hover td {
                        background-color: #0f0f0f;
                    }
                    .image-count {
                        background: #1a1a1a;
                        padding: 2px 8px;
                        border-radius: 4px;
                        font-size: 12px;
                        color: #aaa;
                    }
                    @media (max-width: 768px) {
                        body { padding: 20px; }
                        td, th { padding: 10px; font-size: 12px; }
                        .hide-mobile { display: none; }
                    }
                </style>
            </head>
            <body>
                <h1>XML Sitemap</h1>
                <p class="desc">
                    Index konten untuk Adiel Ebert Nakula Sahdiy. Sitemap ini di-generate secara otomatis untuk memudahkan mesin pencari (SEO) dalam merayapi website.
                </p>
                
                <table>
                    <thead>
                        <tr>
                            <th width="50%">URL Halaman</th>
                            <th width="15%">Prioritas</th>
                            <th width="15%" class="hide-mobile">Frekuensi</th>
                            <th width="20%">Gambar Terkait</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="sitemap:urlset/sitemap:url">
                            <tr>
                                <td>
                                    <a href="{sitemap:loc}" target="_blank">
                                        <xsl:value-of select="sitemap:loc"/>
                                    </a>
                                </td>
                                <td>
                                    <xsl:value-of select="sitemap:priority"/>
                                </td>
                                <td class="hide-mobile">
                                    <xsl:value-of select="sitemap:changefreq"/>
                                </td>
                                <td>
                                    <xsl:if test="count(image:image) &gt; 0">
                                        <span class="image-count">
                                            <xsl:value-of select="count(image:image)"/> Images
                                        </span>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p style="margin-top: 50px; font-size: 12px; color: #555; text-align: center;">
                    Generated by Adiel Ebert SEO System
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
