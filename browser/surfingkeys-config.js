// @ts-nocheck
// Top-level Settings {{{
settings.focusFirstCandidate = true;
settings.hintAlign = "left";
settings.newTabPosition = "right";
unmapAllExcept([], /roamresearch.com/);
unmapAllExcept([], /codesandbox.io/);

// Hinting
Hints.characters = "asdfghjklcvbnmweruio";
// }}}

// Search Engines {{{
removeSearchAliasX("b", "s"); // remove baidu
removeSearchAliasX("w", "s"); // remove bing
removeSearchAliasX("e", "s"); // remove wikipedia (remap later)
removeSearchAliasX("b", "o"); // remove baidu
removeSearchAliasX("w", "o"); // remove bing
removeSearchAliasX("e", "o"); // remove wikipedia (remap later)

// Atlas Admin Panel
addSearchAliasX(
  "ad",
  "atlas admin panel",
  "https://cloud.mongodb.com/v2/admin#atlas/search?search=",
  "s"
);
mapkey("oad", "#8Open Atlas Admin Panel search", function () {
  Front.openOmnibar({ type: "SearchEngine", extra: "ad" });
});

// JQL
addSearchAliasX("jq", "jql", "https://jira.mongodb.org/issues/?jql=", "s");
mapkey("ojq", "#8Open Jira JQL search", function () {
  Front.openOmnibar({ type: "SearchEngine", extra: "jq" });
});

// Atlas Plan Search
addSearchAliasX(
  "ap",
  "atlas plans (provide a groupId)",
  "https://cloud.mongodb.com/v2/admin#atlas/planSearch?groupId=",
  "s"
);
mapkey("oap", "#8Open Atlas Plan Search search", function () {
  Front.openOmnibar({ type: "SearchEngine", extra: "ap" });
});
// }}}

// Dracula Theme
settings.theme = `
/* Edit these variables for easy theme making */
:root {
  /* Font */
  --font: 'JetBrains Mono', 'Source Code Pro', Ubuntu, sans;
  --font-size: 15;
  --font-weight: regular;

  /* -------------- */
  /* --- THEMES --- */
  /* -------------- */

  /* -------------------- */
  /* ----- Dracula ------ */
  /* -------------------- */
  --fg: #f8f8f2;
  --bg: #282a36;
  --bg-dark: #282a36;
  --border: #373b41;
  --main-fg: #81A2BE;
  --accent-fg: #ff79c6;
  --info-fg: #50fa7b;
  --select: #44475a;
  --comment-fg: #6272a4;

  /* Unused Alternate Colors */
  --cyan: #8be9fd;
  --orange: #ffb86c;
  --red: #ff5555;
  --yellow: #f1fa8c;
}

/* ---------- Generic ---------- */
.sk_theme {
background: var(--bg);
color: var(--fg);
  background-color: var(--bg);
  border-color: var(--border);
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}

input {
  font-family: var(--font);
  font-weight: var(--font-weight);
}

.sk_theme tbody {
  color: var(--fg);
}

.sk_theme input {
  color: var(--fg);
}

/* Hints */
#sk_hints .begin {
  color: var(--accent-fg) !important;
}

#sk_tabs .sk_tab {
  background: var(--bg-dark);
  border: 1px solid var(--border);
  color: var(--fg);
}

#sk_tabs .sk_tab_hint {
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--accent-fg);
}

.sk_theme #sk_frame {
  background: var(--bg);
  opacity: 0.2;
  color: var(--accent-fg);
}

/* ---------- Omnibar ---------- */
.sk_theme#sk_omnibar {
  position: absolute;
  top: 20%;
  left: 50%
  transform: translate(-20%, -50%);
}

.sk_theme .title {
  color: var(--accent-fg);
}

.sk_theme .url {
  color: var(--main-fg);
}

.sk_theme .annotation {
  color: var(--accent-fg);
}

.sk_theme .omnibar_highlight {
  color: var(--accent-fg);
}

.sk_theme .omnibar_timestamp {
  color: var(--info-fg);
}

.sk_theme .omnibar_visitcount {
  color: var(--accent-fg);
}

.sk_theme .omnibar_folder {
  color: var(--comment-fg);
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: var(--bg-dark);
}

.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: var(--border);
}

.sk_theme #sk_omnibarSearchArea {
  border-top-color: var(--border);
  border-bottom-color: var(--border);
}

.sk_theme #sk_omnibarSearchArea input,
.sk_theme #sk_omnibarSearchArea span {
  font-size: var(--font-size);
}

.sk_theme .separator {
  color: var(--accent-fg);
}

/* ---------- Popup Notification Banner ---------- */
#sk_banner {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
  background: var(--bg);
  border-color: var(--border);
  color: var(--fg);
  opacity: 0.9;
}

/* ---------- Popup Keys ---------- */
#sk_keystroke {
  background-color: var(--bg);
}

.sk_theme kbd .candidates {
  color: var(--info-fg);
}

.sk_theme span.annotation {
  color: var(--accent-fg);
}

/* ---------- Popup Translation Bubble ---------- */
#sk_bubble {
  background-color: var(--bg) !important;
  color: var(--fg) !important;
  border-color: var(--border) !important;
}

#sk_bubble * {
  color: var(--fg) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(1) {
  border-top-color: var(--border) !important;
  border-bottom-color: var(--border) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(2) {
  border-top-color: var(--bg) !important;
  border-bottom-color: var(--bg) !important;
}

/* ---------- Search ---------- */
#sk_status,
#sk_find {
  font-size: var(--font-size);
  border-color: var(--border);
}

.sk_theme kbd {
  background: var(--bg-dark);
  border-color: var(--border);
  box-shadow: none;
  color: var(--fg);
}

.sk_theme .feature_name span {
  color: var(--main-fg);
}

/* ---------- ACE Editor ---------- */
#sk_editor {
  background: var(--bg-dark) !important;
  height: 50% !important;
  /* Remove this to restore the default editor size */
}

.ace_dialog-bottom {
  border-top: 1px solid var(--bg) !important;
}

.ace-chrome .ace_print-margin,
.ace_gutter,
.ace_gutter-cell,
.ace_dialog {
  background: var(--bg) !important;
}

.ace-chrome {
  color: var(--fg) !important;
}

.ace_gutter,
.ace_dialog {
  color: var(--fg) !important;
}

.ace_cursor {
  color: var(--fg) !important;
}

.normal-mode .ace_cursor {
  background-color: var(--fg) !important;
  border: var(--fg) !important;
  opacity: 0.7 !important;
}

.ace_marker-layer .ace_selection {
  background: var(--select) !important;
}

.ace_editor,
.ace_dialog span,
.ace_dialog input {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}
`;
