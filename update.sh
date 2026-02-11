#!/bin/bash
set -e

echo "Starting daily news update at $(date -u)"

PROMPT="You are updating a daily financial news dashboard. The file is index.html in the current directory. YOUR TASK: 1. Search the web for today's top MarketWatch (use RSS feed at https://feeds.content.dowjones.io/public/rss/mw_topstories for real marketwatch.com/story URLs), Barron's, and Seeking Alpha news/analysis articles. 2. Search for current market data: Dow, S&P 500, NASDAQ, Russell 2000, WTI oil, gold, silver, copper prices. 3. Read the existing index.html to understand the exact HTML structure and styling. 4. Update index.html with: Fresh market data in the Market Overview grid (8 cards), new articles organized into segments (市场动态, 财报季, 股票精选, 宏观经济, 人工智能, 大宗商品, 加密货币, 企业动态), each article needs English title, Chinese summary (2-3 sentences), source tag (MarketWatch/Barron's/SA), date, and link to original article. Update the date in the header date-badge and footer. Keep the EXACT same HTML structure, CSS, and JavaScript. Use the news-grid layout within each segment. Aim for 16-21 total articles. Source tags: source-mw for MarketWatch, source-bar for Barron's, source-sa for Seeking Alpha. IMPORTANT: Keep all existing CSS and JS code unchanged. Only update content inside market-grid and segment-sections. Every MarketWatch news card MUST link to a real marketwatch.com/story URL. Keep the refresh-info section unchanged. Sources are MarketWatch, Barron's, and Seeking Alpha (NOT WSJ)."

echo "$PROMPT" | claude -p --allowedTools 'WebSearch,WebFetch,Read,Write,Edit'

echo "Update complete at $(date -u)"
