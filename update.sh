#!/bin/bash
set -e

echo "Starting daily news update at $(date -u)"

PROMPT="You are updating a daily financial news dashboard. The file is index.html in the current directory. YOUR TASK: 1. Search the web for today's top MarketWatch (use RSS feed at https://feeds.content.dowjones.io/public/rss/mw_topstories for real marketwatch.com/story URLs), Barron's, Seeking Alpha, and The Insurer (https://www.theinsurer.com/ for insurance/reinsurance industry news) articles from the LAST 2 DAYS. 2. Read the existing index.html to understand the exact HTML structure and styling. 3. Update index.html with: New articles organized into segments (市场动态, 财报季, 股票精选, 宏观经济, 人工智能, 大宗商品, 加密货币, 企业动态, 保险行业), each article needs English title, Chinese summary (2-3 sentences), source tag, date, and link to original article. Update the date in the header date-badge and footer. Keep the EXACT same HTML structure, CSS, and JavaScript. Use the news-grid layout within each segment. Aim for 18-24 total articles. Source tags: source-mw for MarketWatch, source-bar for Barron's, source-sa for Seeking Alpha, source-ins for The Insurer. IMPORTANT: Keep all existing CSS and JS code unchanged. Only update content inside segment-sections. Every MarketWatch news card MUST link to a real marketwatch.com/story URL. The Insurer articles should go into the 保险行业 (insurance) segment with tag-insurance class. DO NOT modify the TradingView live market widgets in market-widget-wrap sections — they auto-update. DO NOT repeat any article across different segments — each article URL must appear only once in the entire page. Keep the refresh-info section unchanged. Sources are MarketWatch, Barron's, Seeking Alpha, and The Insurer."

echo "$PROMPT" | claude -p --allowedTools 'WebSearch,WebFetch,Read,Write,Edit'

echo "Update complete at $(date -u)"
