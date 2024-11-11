import React from 'react';
import { convertValue } from 'utils/misc';

export default function Stick({ value }) {
	return (
		<svg
			className='absolute top-[8.2rem] left-9 transition-transform z-50'
			transform={`rotate(${convertValue(value * 1000, 0, 1000, 0, 15.8)}, -30, -72)`}
			width='200'
			height='94.727'
			viewBox='0 0 200 94.727'
			fill='none'
			xmlns='http://www.w3.org/2000/svg'
		>
			<g filter='url(#filter0_dd_115_389)'>
				<path d='M14.243 48.1399L36.9353 14.6644L39.9488 16.6397L14.243 48.1399Z' fill='url(#paint0_linear_115_389)' />
				<path d='M36.9667 14.8211L39.7806 16.6656L15.7771 46.0798L36.9667 14.8211Z' stroke='black' stroke-opacity='0.26' stroke-width='0.227825' />
			</g>
			<defs>
				<filter id='filter0_dd_115_389' x='0.273218' y='3.22146' width='65.8002' height='44.1713' filterUnits='userSpaceOnUse' color-interpolation-filters='sRGB'>
					<feFlood flood-opacity='0' result='BackgroundImageFix' />
					<feColorMatrix in='SourceAlpha' type='matrix' values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0' result='hardAlpha' />
					<feOffset />
					<feGaussianBlur stdDeviation='2.27825' />
					<feComposite in2='hardAlpha' operator='out' />
					<feColorMatrix type='matrix' values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.53 0' />
					<feBlend mode='normal' in2='BackgroundImageFix' result='effect1_dropShadow_115_389' />
					<feColorMatrix in='SourceAlpha' type='matrix' values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0' result='hardAlpha' />
					<feOffset />
					<feGaussianBlur stdDeviation='6.89171' />
					<feComposite in2='hardAlpha' operator='out' />
					<feColorMatrix type='matrix' values='0 0 0 0 1 0 0 0 0 0.5792 0 0 0 0 0.116667 0 0 0 1 0' />
					<feBlend mode='normal' in2='effect1_dropShadow_115_389' result='effect2_dropShadow_115_389' />
					<feBlend mode='normal' in='SourceGraphic' in2='effect2_dropShadow_115_389' result='shape' />
				</filter>
				<linearGradient id='paint0_linear_115_389' x1='13.8847' y1='17.455' x2='51.8102' y2='31.9285' gradientUnits='userSpaceOnUse'>
					<stop stop-color='#FFA700' />
					<stop offset='1' stop-color='#FF6B00' />
				</linearGradient>
			</defs>
		</svg>
	);
}
