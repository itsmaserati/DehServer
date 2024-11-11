import React from 'react';

export default function Nitro({ value }) {
	const length = 338;
	const offset = length - (length * value) / 200;
	return (
		<>
			<svg width='87' height='223' viewBox='0 0 87 223' fill='none' xmlns='http://www.w3.org/2000/svg'>
				<path
					d='M58.8147 222.358V213.828C58.8147 213.462 58.6384 213.118 58.3409 212.904L12.1106 179.64C6.79466 175.654 -2.58414 162.781 2.42801 143.188C8.63529 118.924 18.1969 82.359 33.8827 50.6659C34.1346 50.1569 33.9769 49.5419 33.5067 49.2236C32.0566 48.242 29.0148 46.2136 27.1999 45.2236'
					stroke='white'
					stroke-width='1.70869'
				/>
				<path
					d='M49.0887 56.0449C36.0609 84.4513 25.6306 118.618 20.3655 139.201C15.6437 157.66 17.5182 161.414 22.0744 165.401L67.0694 195.905'
					stroke='url(#paint0_linear_3820_1225)'
					stroke-opacity='0.5'
					stroke-width='18.226'
					stroke-dasharray='28.48 4.56'
				/>
				<path
					d='M49.0887 56.0449C36.0609 84.4513 25.6306 118.618 20.3655 139.201C15.6437 157.66 17.5182 161.414 22.0744 165.401L67.0694 195.905'
					stroke='url(#paint1_linear_3820_1225)'
					stroke-opacity='0.5'
					stroke-width='18.226'
					stroke-dasharray='28.48 4.56'
				/>
				<path
					d='M30.6172 39.528L36.2291 43.2692C36.8485 43.6821 37.6897 43.404 37.966 42.7128C42.7138 30.8321 57.4581 12.7068 84.1468 12.1998C84.7758 12.1878 85.2952 11.6789 85.2952 11.0498V3.64551'
					stroke='#F93E45'
					stroke-width='1.70869'
				/>
				<path
					d='M84.1567 29.2754C61.9438 29.2755 55.6786 41.8057 51.1221 51.4882'
					stroke='url(#paint2_linear_3820_1225)'
					stroke-opacity='0.5'
					stroke-width='18.226'
					stroke-dasharray='27.34 4.56'
				/>
				<path
					d='M84.1567 29.2754C61.9438 29.2755 55.6786 41.8057 51.1221 51.4882M49.0887 56.0449C36.0609 84.4513 25.6306 118.618 20.3655 139.201C15.6437 157.66 17.5182 161.414 22.0744 165.401L67.0694 195.905'
					stroke='url(#paint3_linear_3820_1225)'
					stroke-width='18.226'
					stroke-dasharray={length}
					strokeDashoffset={offset}
				/>
				<path d='M79.9889 1.2541H81.0972V8H79.9889V5.07999H77.0978V8H75.9895V1.2541H77.0978V4.01992H79.9889V1.2541Z' fill='#F93E45' />
				<path
					d='M68.5477 221.253C67.3507 221.253 66.3583 220.859 65.5705 220.071C64.7826 219.276 64.3887 218.295 64.3887 217.128C64.3887 215.962 64.7826 214.984 65.5705 214.197C66.3583 213.401 67.3507 213.003 68.5477 213.003C69.2673 213.003 69.9302 213.174 70.5362 213.515C71.1499 213.856 71.6271 214.318 71.968 214.901L70.8317 215.56C70.6196 215.166 70.309 214.856 69.8999 214.628C69.4984 214.394 69.0476 214.276 68.5477 214.276C67.6992 214.276 67.0098 214.545 66.4795 215.083C65.9568 215.621 65.6955 216.303 65.6955 217.128C65.6955 217.954 65.9568 218.636 66.4795 219.174C67.0098 219.712 67.6992 219.981 68.5477 219.981C69.0476 219.981 69.5022 219.867 69.9113 219.64C70.3203 219.405 70.6271 219.09 70.8317 218.696L71.968 219.344C71.6347 219.927 71.1612 220.393 70.5476 220.742C69.9416 221.083 69.2749 221.253 68.5477 221.253Z'
					fill='white'
				/>
				<defs>
					<linearGradient id='paint0_linear_3820_1225' x1='27.7696' y1='91.9274' x2='44.8565' y2='97.623' gradientUnits='userSpaceOnUse'>
						<stop stop-color='white' />
						<stop offset='1' stop-color='white' stop-opacity='0' />
					</linearGradient>
					<linearGradient id='paint1_linear_3820_1225' x1='36.8826' y1='182.488' x2='47.7043' y2='168.818' gradientUnits='userSpaceOnUse'>
						<stop stop-color='white' />
						<stop offset='1' stop-color='white' stop-opacity='0' />
					</linearGradient>
					<linearGradient id='paint2_linear_3820_1225' x1='73.9046' y1='45.2232' x2='56.2481' y2='24.1493' gradientUnits='userSpaceOnUse'>
						<stop stop-color='#F93E45' stop-opacity='0' />
						<stop offset='1' stop-color='#F93E45' />
					</linearGradient>
					<linearGradient id='paint3_linear_3820_1225' x1='50.8826' y1='29.2764' x2='50.8826' y2='195.906' gradientUnits='userSpaceOnUse'>
						<stop stop-color='#F93E45' />
						<stop offset='0.215004' stop-color='white' />
					</linearGradient>
				</defs>
			</svg>
		</>
	);
}
