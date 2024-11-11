import React from 'react';

export default function Fuel({ value }) {
	const length = 339;
	const offset = length - (length * value) / 200;
	return (
		<svg width='87' height='223' viewBox='0 0 87 223' fill='none' xmlns='http://www.w3.org/2000/svg'>
			<path
				d='M28.2351 222.358V213.828C28.2351 213.462 28.4114 213.118 28.7089 212.904L74.9392 179.64C80.2551 175.654 89.6339 162.781 84.6218 143.188C78.4145 118.924 68.8529 82.359 53.1671 50.6659C52.9152 50.1569 53.0729 49.5419 53.5431 49.2236C54.9932 48.242 58.035 46.2136 59.8499 45.2236'
				stroke='white'
				stroke-width='1.70869'
			/>
			<path
				d='M37.9611 56.0449C50.989 84.4513 61.4192 118.618 66.6843 139.201C71.4061 157.66 69.5316 161.414 64.9754 165.401L19.9804 195.905'
				stroke='url(#paint0_linear_3820_1234)'
				stroke-width='18.226'
				stroke-dasharray='28.48 4.56'
			/>
			<path
				d='M37.9611 56.0449C50.989 84.4513 61.4192 118.618 66.6843 139.201C71.4061 157.66 69.5316 161.414 64.9754 165.401L19.9804 195.905'
				stroke='url(#paint1_linear_3820_1234)'
				stroke-width='18.226'
				stroke-dasharray='28.48 4.56'
			/>

			<path
				d='M37.9611 56.0449C50.989 84.4513 61.4192 118.618 66.6843 139.201C71.4061 157.66 69.5316 161.414 64.9754 165.401L19.9804 195.905'
				stroke='url(#paint4_linear_3820_1234)'
				stroke-width='18.226'
				stroke-dasharray={length}
				strokeDashoffset={offset}
				className='transition-all'
			/>
			<path
				d='M56.4326 39.528L50.8207 43.2692C50.2013 43.6821 49.3601 43.404 49.0839 42.7128C44.336 30.8321 29.5917 12.7068 2.90297 12.1998C2.27396 12.1878 1.75458 11.6789 1.75458 11.0498V3.64551'
				stroke='white'
				stroke-width='1.70869'
			/>
			<path d='M2.89406 29.2754C25.107 29.2755 31.3722 41.8057 35.9287 51.4882' stroke='url(#paint2_linear_3820_1234)' stroke-width='18.226' stroke-dasharray='27.34 4.56' />

			<path
				d='M2.89406 29.2754C25.107 29.2755 31.3722 41.8057 35.9287 51.4882'
				stroke='url(#paint4_linear_3820_1234)'
				stroke-width='18.226'
				stroke-dasharray={length}
				strokeDashoffset={offset}
				className='transition-all'
			/>

			<mask id='path-5-inside-1_3820_1234' fill='white'>
				<path d='M26.8154 25.8578L15.9937 41.236L18.272 22.4404C21.0059 22.8961 24.9169 24.5288 26.8154 25.8578Z' />
			</mask>
			<path
				d='M15.9937 41.236L22.5148 45.8249L8.07779 40.2765L15.9937 41.236ZM26.8154 25.8578L31.3881 19.3253L37.9368 23.9094L33.3365 30.4467L26.8154 25.8578ZM18.272 22.4404L10.356 21.4809L11.3593 13.2044L19.5829 14.575L18.272 22.4404ZM9.47264 36.6471L20.2943 21.2689L33.3365 30.4467L22.5148 45.8249L9.47264 36.6471ZM22.2427 32.3903C21.9721 32.2008 21.1229 31.7229 19.8606 31.2111C18.6234 30.7094 17.5535 30.4046 16.9611 30.3058L19.5829 14.575C23.4606 15.2213 28.4913 17.2975 31.3881 19.3253L22.2427 32.3903ZM26.1879 23.3999L23.9097 42.1955L8.07779 40.2765L10.356 21.4809L26.1879 23.3999Z'
				fill='url(#paint3_linear_3820_1234)'
				mask='url(#path-5-inside-1_3820_1234)'
			/>
			<path d='M9.79764 2.31417H6.95472V4.20302H9.70127V5.26309H6.95472V8H5.84647V1.2541H9.79764V2.31417Z' fill='white' />
			<path d='M18.5004 219.856H22.023V221.105H17.1936V213.151H21.9662V214.401H18.5004V216.469H21.6821V217.708H18.5004V219.856Z' fill='white' />
			<defs>
				<linearGradient id='paint0_linear_3820_1234' x1='59.2802' y1='91.9274' x2='42.1933' y2='97.623' gradientUnits='userSpaceOnUse'>
					<stop stop-color='white' />
					<stop offset='1' stop-color='white' stop-opacity='0' />
				</linearGradient>
				<linearGradient id='paint1_linear_3820_1234' x1='50.1672' y1='182.488' x2='39.3455' y2='168.818' gradientUnits='userSpaceOnUse'>
					<stop stop-color='white' />
					<stop offset='1' stop-color='white' stop-opacity='0' />
				</linearGradient>
				<linearGradient id='paint2_linear_3820_1234' x1='13.1462' y1='45.2232' x2='30.8026' y2='24.1493' gradientUnits='userSpaceOnUse'>
					<stop stop-color='white' stop-opacity='0' />
					<stop offset='1' stop-color='white' />
				</linearGradient>
				<linearGradient id='paint3_linear_3820_1234' x1='14.2949' y1='43.2223' x2='32.4978' y2='35.9367' gradientUnits='userSpaceOnUse'>
					<stop stop-color='white' stop-opacity='0' />
					<stop offset='1' stop-color='white' />
				</linearGradient>
				<linearGradient id='paint4_linear_3820_1234' x1='36.1653' y1='29.2754' x2='36.1653' y2='195.905' gradientUnits='userSpaceOnUse'>
					<stop stop-color='#FFDE88' />
					<stop offset='0.723591' stop-color='white' />
				</linearGradient>
			</defs>
		</svg>
	);
}
