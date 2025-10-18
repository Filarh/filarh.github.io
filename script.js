const themeToggle = document.getElementById('theme-toggle');
const rootElement = document.documentElement;
const storageKey = 'portfolio-theme';

const prefersDark = window.matchMedia('(prefers-color-scheme: dark)');

const applyTheme = (theme) => {
    rootElement.setAttribute('data-theme', theme);
    const nextModeLabel = theme === 'dark' ? 'Modo claro' : 'Modo oscuro';
    themeToggle.querySelector('.theme-toggle__label').textContent = nextModeLabel;
    themeToggle.setAttribute('aria-label', `Cambiar a ${nextModeLabel.toLowerCase()}`);
};

const getStoredTheme = () => localStorage.getItem(storageKey);

const initialTheme = getStoredTheme() || (prefersDark.matches ? 'dark' : 'light');
applyTheme(initialTheme);

const updateToggleLabel = (event) => {
    const newTheme = event.matches ? 'dark' : 'light';
    if (!getStoredTheme()) {
        applyTheme(newTheme);
    }
};

prefersDark.addEventListener('change', updateToggleLabel);

themeToggle.addEventListener('click', () => {
    const currentTheme = rootElement.getAttribute('data-theme');
    const nextTheme = currentTheme === 'dark' ? 'light' : 'dark';
    applyTheme(nextTheme);
    localStorage.setItem(storageKey, nextTheme);
});

const currentYearElement = document.getElementById('current-year');
if (currentYearElement) {
    currentYearElement.textContent = new Date().getFullYear();
}
