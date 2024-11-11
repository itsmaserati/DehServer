import React from 'react';
import { convertValue } from 'utils/misc';

export default function Stick({ value }) {
	return (
		<svg
			transform={`rotate(${convertValue(value * 1000, 0, 1000, 0, 15.73)}, 5.5, -64)`}
			className='absolute left-[3.25rem] -bottom-[4.6875rem] -z-10 transition-all'
			width='159'
			height='278'
			viewBox='0 0 159 278'
			fill='none'
			xmlns='http://www.w3.org/2000/svg'
		>
			<path d='M87.0075 72.4874L0.334961 188.681L90.9605 75.4662L87.0075 72.4874Z' fill='url(#paint1_linear_115_389)' />
			<defs>
				<filter id='filter0_b_115_389' x='-112.725' y='-129.724' width='401.417' height='401.417' filterUnits='userSpaceOnUse' color-interpolation-filters='sRGB'>
					<feFlood flood-opacity='0' result='BackgroundImageFix' />
					<feGaussianBlur in='BackgroundImageFix' stdDeviation='65.1043' />
					<feComposite in2='SourceAlpha' operator='in' result='effect1_backgroundBlur_115_389' />
					<feBlend mode='normal' in='SourceGraphic' in2='effect1_backgroundBlur_115_389' result='shape' />
				</filter>
				<linearGradient id='paint0_linear_115_389' x1='88.586' y1='23.9844' x2='88.5056' y2='141.484' gradientUnits='userSpaceOnUse'>
					<stop stop-color='#0097FF' stop-opacity='0' />
					<stop offset='0.58235' stop-color='#0097FF' stop-opacity='0.196456' />
					<stop offset='1' stop-color='#0097FF' stop-opacity='0.71' />
				</linearGradient>
				<linearGradient id='paint1_linear_115_389' x1='13.4472' y1='171.026' x2='91.9117' y2='74.7756' gradientUnits='userSpaceOnUse'>
					<stop stop-color='#B5E1FF' />
					<stop offset='1' stop-color='#0097FF' />
				</linearGradient>
			</defs>
		</svg>
	);
}
