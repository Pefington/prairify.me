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
        fjalla: ["Fjalla One", ...defaultTheme.fontFamily.sans],
        dosis: ["Dosis", ...defaultTheme.fontFamily.sans],
        quicksand: ["Quicksand", ...defaultTheme.fontFamily.sans],
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      backgroundImage: {
        "google-signin": "url('images/btn_google_signin_dark_normal_web.png')",
      },
      colors: {
        neutral: {
          light: "#585d65",
          dark: "#333339",
        },
        card: "#f7f7f3",
        vivid: "#12433c",
        middle: "#086",
        soft: "#3ea57a",
        inverse: "#efe",
        accent: "#ff9d00",
        error: "#f00",
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
