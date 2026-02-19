<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <html lang="id">
            <head>
                <title>Sitemap | Ebert</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                
                <!-- Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com" />
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin" />
                <link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda:ital,opsz,wght@0,6..96,400;0,6..96,500;0,6..96,700;1,6..96,400&amp;family=Pirata+One&amp;family=Texturina:ital,opsz,wght@0,12..72,100..900;1,12..72,100..900&amp;family=UnifrakturMaguntia&amp;family=Tenor+Sans&amp;display=swap" rel="stylesheet" />
                
                <!-- Bootstrap CSS (Optional for grid, but we'll use custom for lightweight XSL) -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />

                <style>
                    :root {
                        --bg-dark: #050505;
                        --bg-card: #0f0f0f;
                        --text-main: #f0f0f0;
                        --text-muted: #b0b0b0;
                        --font-old-english: 'UnifrakturMaguntia', cursive;
                        --font-heading: 'Bodoni Moda', serif;
                        --font-body: 'Tenor Sans', sans-serif;
                        --gold-accent: #d4af37;
                    }

                    * {
                        box-sizing: border-box;
                        margin: 0;
                        padding: 0;
                    }

                    body {
                        background-color: var(--bg-dark);
                        color: var(--text-main);
                        font-family: var(--font-body);
                        line-height: 1.8;
                        letter-spacing: 0.05em;
                        min-height: 100vh;
                        display: flex;
                        flex-direction: column;
                    }

                    /* --- Navbar Simulation --- */
                    .navbar {
                        padding: 20px 0;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.08);
                        background-color: rgba(5, 5, 5, 0.9);
                        backdrop-filter: blur(15px);
                        position: sticky;
                        top: 0;
                        z-index: 1000;
                    }

                    .navbar-container {
                        max-width: 1200px;
                        margin: 0 auto;
                        padding: 0 20px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .brand {
                        font-family: var(--font-old-english);
                        font-size: 2rem;
                        color: #fff;
                        text-decoration: none;
                        text-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
                    }

                    .back-link {
                        font-size: 0.85rem;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                        color: #ccc;
                        text-decoration: none;
                        transition: color 0.3s;
                    }

                    .back-link:hover {
                        color: var(--gold-accent);
                    }

                    @media (max-width: 768px) {
                        .sitemap-item {
                            flex-direction: column;
                            align-items: flex-start;
                            gap: 10px;
                        }
                        /* Mobile Image Compact View - Ultra Mini */
                        .image-gallery {
                            display: grid;
                            grid-template-columns: repeat(4, 1fr); /* 4 Gambar per baris (Sangat kecil) */
                            gap: 5px;
                            width: 100%;
                            padding-left: 0;
                            margin-top: 5px;
                        }
                        
                        .sitemap-image-container {
                            width: 100%;
                            border: 1px solid rgba(255,255,255,0.05);
                            background: #080808;
                            border-radius: 3px;
                            overflow: hidden;
                        }
                        
                        .sitemap-thumb {
                            width: 100% !important;
                            height: 80px !important; /* Tinggi sangat kecil */
                            object-fit: contain !important; 
                            background: #000;
                            padding: 0;
                        }
                        
                        .image-caption {
                            display: none; 
                        }
                        
                        .sitemap-image-container:hover {
                            transform: none;
                        }
                    }

                    /* --- Main Content --- */
                    .container {
                        max-width: 900px;
                        margin: 80px auto;
                        padding: 0 20px;
                        flex: 1;
                    }

                    .section-title {
                        font-family: 'Pirata One', cursive;
                        font-size: clamp(2.5rem, 6vw, 4rem);
                        text-align: center;
                        margin-bottom: 20px;
                        text-transform: uppercase;
                        letter-spacing: 6px;
                        color: #fff;
                        text-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
                    }

                    .section-line {
                        width: 120px;
                        height: 3px;
                        background: linear-gradient(90deg, transparent, var(--gold-accent), transparent);
                        margin: 0 auto 60px auto;
                        position: relative;
                    }

                    .section-line::before {
                        content: '❖';
                        position: absolute;
                        top: 50%;
                        left: 50%;
                        transform: translate(-50%, -50%);
                        color: var(--gold-accent);
                        background: var(--bg-dark);
                        padding: 0 10px;
                        font-size: 1.2rem;
                    }

                    /* --- Sitemap List --- */
                    .sitemap-list {
                        list-style: none;
                        display: flex;
                        flex-direction: column;
                        gap: 20px;
                    }

                    .sitemap-item {
                        border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                        padding-bottom: 20px;
                        transition: all 0.4s ease;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                    }

                    .sitemap-item:hover {
                        border-bottom-color: var(--gold-accent);
                        transform: translateX(10px);
                    }

                    .sitemap-link {
                        font-family: var(--font-heading);
                        font-size: 1.2rem;
                        color: #ccc;
                        text-decoration: none;
                        letter-spacing: 1px;
                        transition: color 0.3s, text-shadow 0.3s;
                    }

                    /* Hover Effect */
                    .sitemap-item:hover .sitemap-link {
                        color: var(--gold-accent);
                        text-shadow: 0 0 15px rgba(212, 175, 55, 0.4);
                    }

                    .meta-info {
                        font-family: var(--font-body);
                        font-size: 0.75rem;
                        color: #555;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                    }

                    .sitemap-item:hover .meta-info {
                        color: #888;
                    }

                    /* Image Gallery in Sitemap */
                    .image-gallery {
                        display: flex;
                        flex-wrap: wrap;
                        gap: 15px;
                        margin-top: 15px;
                        padding-left: 20px;
                    }

                    .sitemap-image-container {
                        position: relative;
                        overflow: hidden;
                        border-radius: 8px;
                        border: 1px solid rgba(255, 255, 255, 0.1);
                        transition: transform 0.3s ease;
                    }

                    .sitemap-image-container:hover {
                        transform: scale(1.05);
                        border-color: var(--gold-accent);
                        z-index: 10;
                    }

                    .sitemap-thumb {
                        height: 120px;
                        width: auto; /* Natural width */
                        max-width: 200px;
                        display: block;
                        object-fit: contain; /* DO NOT CROP */
                        background: #111;
                    }
                    
                    .image-caption {
                        display: none;
                        position: absolute;
                        bottom: 0;
                        left: 0;
                        right: 0;
                        background: rgba(0,0,0,0.8);
                        color: #fff;
                        font-size: 10px;
                        padding: 4px;
                        text-align: center;
                    }

                    .sitemap-image-container:hover .image-caption {
                        display: block;
                    }
                </style>
            </head>
            <body>
                <!-- Navbar -->
                <nav class="navbar">
                    <div class="navbar-container">
                        <a href="https://ebert-nakula.vercel.app/" class="brand">EBERT.</a>
                        <a href="https://ebert-nakula.vercel.app/" class="back-link">KEMBALI KE HOME</a>
                    </div>
                </nav>

                <!-- Content -->
                <div class="container">
                    <h1 class="section-title">ARSIP WEBSITE</h1>
                    <div class="section-line"></div>

                    <ul class="sitemap-list">
                        <xsl:for-each select="sitemap:urlset/sitemap:url">
                            <li class="sitemap-item-wrapper" style="border-bottom: 1px solid rgba(255,255,255,0.05); padding-bottom: 30px; margin-bottom: 20px;">
                                <div class="sitemap-item">
                                    <a href="{sitemap:loc}" class="sitemap-link">
                                        <xsl:value-of select="sitemap:loc"/>
                                    </a>
                                    
                                    <div class="meta-info">
                                        <span>Last Mod: <xsl:value-of select="sitemap:lastmod"/></span>
                                    </div>
                                </div>
                                
                                <!-- Render Items Images if Available -->
                                <xsl:if test="count(image:image) &gt; 0">
                                    <div class="image-gallery">
                                        <xsl:for-each select="image:image">
                                            <div class="sitemap-image-container">
                                                <a href="{image:loc}" target="_blank">
                                                    <img src="{image:loc}" alt="{image:title}" class="sitemap-thumb" />
                                                </a>
                                                <xsl:if test="image:title">
                                                    <div class="image-caption"><xsl:value-of select="image:title"/></div>
                                                </xsl:if>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>

                <!-- Footer -->
                <footer class="footer">
                    &copy; 2026 Adiel Ebert Nakula Sahdiy. Sitemap Generated Automatically.
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
