import { useData } from 'contexts/DataContext';
import moment from 'moment';
import React from 'react';

export default function BottomInfos() {
	const { useRealTime, time } = useData();
	return (
		<div className='flex -translate-y-9'>
			<p className='-translate-x-1 text-sm text-white font-gr-b'>{useRealTime ? moment().format('LT') : time}</p>
			<svg className='rotate-180' width='196' height='26' viewBox='0 0 196 26' fill='none' xmlns='http://www.w3.org/2000/svg'>
				<path
					d='M1.19922 1.48018L19.9615 19.9947C22.7328 22.7294 26.4696 24.2627 30.363 24.2627H165.687C169.58 24.2627 173.317 22.7294 176.088 19.9947L194.851 1.48018'
					stroke='url(#paint0_radial_3820_1245)'
					stroke-width='1.70869'
				/>
				<defs>
					<radialGradient id='paint0_radial_3820_1245' cx='0' cy='0' r='1' gradientUnits='userSpaceOnUse' gradientTransform='translate(93.5488 24.2627) rotate(-90) scale(26.9671 215.344)'>
						<stop stop-color='white' stop-opacity='0.74' />
						<stop offset='1' stop-color='white' stop-opacity='0' />
					</radialGradient>
				</defs>
			</svg>
			<span className='translate-x-1 text-sm text-white font-gr-b'>
				{moment().format('DD')}
				<span className='text-xs font-gr-r'>, {moment().format('MMM')}</span>
			</span>
		</div>
	);
}
