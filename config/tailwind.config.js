module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      // fontFamily: {
      //   sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      // },
      colors: {
        'custom-blue': '#2C6FA2',
        'custom-green': '#55C500',
        'custom-orange': '#FAD47A',
        'custom-gray': '#EDEEEE',
      },
      height:   {
        'screen-minus-header': 'calc(100vh - 100px)',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
