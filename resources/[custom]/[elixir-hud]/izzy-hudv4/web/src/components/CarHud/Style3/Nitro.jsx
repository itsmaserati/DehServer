import React from 'react';

export default function Nitro({ value }) {
	const length = 94;
	const offset = length - (length * value) / 100;
	return (
		<svg width='35' height='107' viewBox='0 0 35 107' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<mask id='mask0_3820_1396' style={{ maskType: 'alpha' }} maskUnits='userSpaceOnUse' x='5' y='0' width='30' height='90'>
				<path d='M8.43809 4.00088L25.3641 20.9269C28.4149 23.9777 30.1289 28.1156 30.1289 32.4302V89.8604' stroke='white' stroke-width='9.03784' stroke-dasharray='18.08 3.62' />
			</mask>
			<g mask='url(#mask0_3820_1396)'>
				<path
					d='M8.43809 4.00088L25.3641 20.9269C28.4149 23.9777 30.1289 28.1156 30.1289 32.4302V89.8604'
					stroke='white'
					stroke-opacity='0.18'
					stroke-width='9.03784'
					stroke-dasharray='18.08 3.62'
				/>
				<path
					d='M8 4L23.5 19L27 23L27.2678 23.4017C29.0493 26.074 30 29.2139 30 32.4256V33.5V38.6891V90'
					stroke='url(#paint0_linear_3820_1396)'
					stroke-width='9.03784'
					strokeDasharray={length}
					strokeDashoffset={offset}
					className='transition-all'
				/>
			</g>
			<path d='M1.20752 11.2311L17.2886 28.1163C18.569 29.4607 19.2832 31.2462 19.2832 33.1027V89.8604' stroke='white' stroke-width='1.08454' />
			<rect x='2.09863' y='11.8066' width='1.08454' height='3.61514' transform='rotate(-135.628 2.09863 11.8066)' fill='white' />
			<rect x='14.0068' y='24.3223' width='1.08454' height='3.61514' transform='rotate(-135.628 14.0068 24.3223)' fill='white' />
			<rect x='19.2832' y='34.7295' width='1.08454' height='3.61514' transform='rotate(-90 19.2832 34.7295)' fill='white' />
			<rect x='19.2832' y='49.1895' width='1.08454' height='3.61514' transform='rotate(-90 19.2832 49.1895)' fill='white' />
			<rect x='19.2832' y='63.6504' width='1.08454' height='3.61514' transform='rotate(-90 19.2832 63.6504)' fill='white' />
			<rect x='19.2832' y='78.1104' width='1.08454' height='3.61514' transform='rotate(-90 19.2832 78.1104)' fill='white' />
			<rect x='19.2832' y='88.9561' width='1.08454' height='3.61514' transform='rotate(-90 19.2832 88.9561)' fill='white' />
			<path
				d='M27.8225 98.4797H25.0027L24.0989 102.764H21.8756L23.4482 95.3165H25.6715L25.4004 96.5999H28.2202L27.8225 98.4797ZM31.3654 94.232H23.6832L24.0809 92.3702H31.763L31.3654 94.232Z'
				fill='white'
			/>
			<defs>
				<linearGradient id='paint0_linear_3820_1396' x1='19' y1='90' x2='19' y2='4' gradientUnits='userSpaceOnUse'>
					<stop stop-color='#FFD568' />
					<stop offset='1' stop-color='#99803E' />
				</linearGradient>
			</defs>
		</svg>
	);
}
