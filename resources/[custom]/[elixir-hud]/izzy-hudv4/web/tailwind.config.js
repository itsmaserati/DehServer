/** @type {import('tailwindcss').Config} */
export default {
	content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
	theme: {
		extend: {
			fontFamily: {
				'gr-l': 'Gilroy-Light',
				'gr-r': 'Gilroy-Regular',
				'gr-m': 'Gilroy-Medium',
				'gr-sb': 'Gilroy-SemiBold',
				'gr-b': 'Gilroy-Bold',
				'mm-r': '"MonumentRegular", sans-serif',
				'mm-ub': '"MonumentUltraBold", sans-serif',
				br: '"Barlow", sans-serif',
				hemi: 'Hemi',
				ow: '"Oswald", sans-serif',
				ac: 'Agency',
			},
			keyframes: {
				color: {
					'0%, 100%': { fill: '#6AFF70' },
					'50%': { fill: '#6AFF7050' },
				},
			},
			animation: {
				color: 'color 1s ease-in-out infinite',
			},
		},
	},
	plugins: [],
};
