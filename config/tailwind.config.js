const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        FjallaOne: ["Fjalla One", ...defaultTheme.fontFamily.sans],
        Cantarell: ["Cantarell", ...defaultTheme.fontFamily.sans],
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      textColor: {
        skin: {
          base: "var(--color-text-base)",
          muted: "var(--color-text-muted)",
          inverted: "var(--color-text-inverted)",
        },
      },
      backgroundColor: {
        skin: {
          "button-accent": "var(--color-button-accent)",
          "button-accent-hover": "var(--color-button-accent-hover)",
          "button-muted": "var(--color-button-muted)",
          "button-muted-hover": "var(--color-button-muted-hover)",
          "button-warning": "var(--color-button-warning)",
          "button-warning-hover": "var(--color-button-warning-hover)",
        },
      },
      backgroundImage: {
        "google-signin": "url('images/btn_google_signin_dark_normal_web.png')",
      },
      borderColor: {
        skin: {
          "border-base": "var(--color-border-base)",
        },
      },
    },
  },
  variants: {
    extend: {
      lineClamp: ["hover"],
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
  ],
};
