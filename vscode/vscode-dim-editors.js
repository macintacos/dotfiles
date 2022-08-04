for (element of document.querySelectorAll("*")) {
  element.addEventListener("focusin", doDimWindow);
}

window.addEventListener("blur", doDimWindow);

function doDimWindow() {
  for (element of document.querySelectorAll(".monaco-editor,.terminal")) {
    if (
      (element === document.activeElement ||
        element.contains(document.activeElement)) &&
      document.hasFocus()
    ) {
      element.style.opacity = 1.0;
      continue;
    }
    element.style.opacity = 0.8;
  }
}
