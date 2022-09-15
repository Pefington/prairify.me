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
      backgroundImage: {
        "google-signin": "url('images/btn_google_signin_dark_normal_web.png')",
      },
      colors: {
        base: {
          standard: "#f0f",
          hover: "#E8E8E8",
          focus: "#BDBDBD",
          active: "#DADADA",
          disabled: "#E0E0E0",
          placeholder: "#9E9E9E"
        },
        inverse: {
          standard: "#000",
          hover: "#000",
          focus: "#000",
          active: "#000",
          disabled: "#000",
          placeholder: "#000"
        },
        accent: {
          standard: "#f0f",
          hover: "#E8E8E8",
          focus: "#BDBDBD",
          active: "#DADADA",
          disabled: "#E0E0E0",
          placeholder: "#9E9E9E"
        },
        soft: {
          standard: "#f0f",
          hover: "#E8E8E8",
          focus: "#BDBDBD",
          active: "#DADADA",
          disabled: "#E0E0E0",
          placeholder: "#9E9E9E"
          
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
