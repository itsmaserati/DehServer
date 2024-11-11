import { Clock, DatePicker, topInfoIcons } from 'components/Icons';
import moment from 'moment';
import React from 'react';
import { formatter } from 'utils/misc';
import Weapon from './Weapon';
import * as FaIcons from 'react-icons/fa6';
import { AnimatePresence, motion as m } from 'framer-motion';
import { useData } from 'contexts/DataContext';

export default function Style1({ infos, weapon, isInMove }) {
	const { updatePosition, getPosition } = useData();
	return (
		<>
			<m.div drag={isInMove} dragMomentum={0} onDragEnd={(e) => updatePosition('topInfo', e)} whileDrag={{ cursor: 'grabbing' }} style={getPosition('topInfo')} className='flex justify-end'>
				<div className='flex flex-col items-end'>
					<Date />
					<Infos infos={infos} />
					<Time />
				</div>
				<ServerLogo />
			</m.div>

			<AnimatePresence>{weapon?.label && <Weapon weapon={weapon} isInMove={isInMove} />}</AnimatePresence>
		</>
	);
}

const Date = () => {
	return (
		<>
			<svg width={0} height={0}>
				<defs>
					<clipPath id='dateClip'>
						<path d='M0 22H108L146.215 0H8.48077L0 22Z' fill='black' fill-opacity='0.3' />
					</clipPath>
				</defs>
			</svg>

			<div style={{ clipPath: 'url(#dateClip)' }} className='w-[9.1384rem] h-[1.375rem] bg-black/30 translate-x-[3.1187rem] translate-y-2 flex items-center gap-x-1.5 px-3.5'>
				<DatePicker />
				<p className='font-gr-m text-white/50 text-[.8125rem]'>{moment().format('L')}</p>
			</div>
		</>
	);
};

const Infos = ({ infos }) => {
	return (
		<>
			<svg width={0} height={0}>
				<defs>
					<clipPath id='infosClip'>
						<path d='M0 0H220L208 7V65L220 72H28.0699L0 0Z' fill='url(#paint0_linear_3820_687)' fill-opacity='0.48' />
					</clipPath>
				</defs>
			</svg>
			<div
				style={{ clipPath: 'url(#infosClip)', background: 'linear-gradient(90deg, rgba(0, 0, 0, 0.48) -14.77%, rgba(0, 0, 0, 0.48) 101.36%)' }}
				className='w-[13.75rem] h-[4.5rem] relative py-[.4375rem] pr-7 flex flex-col items-end translate-x-[1.05rem] translate-y-2'
			>
				{infos
					.filter((x) => !x.currency)
					.map((info) => (
						<>
							{info.header ? (
								<span className='text-sm font-gr-m'>
									<span className='text-white/50'>{info.secondValue}</span>
									<span className='text-white'> {info.value}</span>
								</span>
							) : (
								<p className='font-gr-m text-xs text-white/50'>{info.value}</p>
							)}
						</>
					))}

				<div className='flex items-center gap-x-3.5 mt-1'>
					{infos
						.filter((x) => x.currency)
						.map((info) => (
							<div className='flex gap-x-[.3125rem]'>
								<p style={{ color: info.color, textShadow: `0px 0px 21.3px ${info.color}` }} className='text-xs font-gr-sb'>
									{formatter.format(info.value)}
								</p>
								{React.createElement(topInfoIcons[info.icon] ?? FaIcons[info.icon] ?? FaIcons['FaHeart'] ?? topInfoIcons['cash'], {
									style: { color: info.color },
									className: 'w-[.9375rem] h-[.9375rem]',
								})}
							</div>
						))}
				</div>
			</div>
		</>
	);
};

const Time = () => {
	const { time, useRealTime } = useData();
	return (
		<>
			<svg width={0} height={0}>
				<defs>
					<clipPath id='timeClip'>
						<path d='M0 0H77.3033L114.809 22H6.51923L0 0Z' fill='black' fill-opacity='0.3' />
					</clipPath>
				</defs>
			</svg>
			<div style={{ clipPath: 'url(#timeClip)' }} className='w-[7.1756rem] h-[1.375rem] bg-black/30 translate-y-2 translate-x-[3.75rem] flex items-center px-[.5625rem] gap-x-1'>
				<Clock />
				<p className='font-gr-m text-white/50 text-[.8125rem]'>{useRealTime ? moment().format('LT') : time}</p>
			</div>
		</>
	);
};

const ServerLogo = () => {
	return (
		<div className='w-[6.875rem] h-[7.875rem] relative flex items-center justify-center'>
			<svg className='absolute left-0 top-0' width='110' height='126' viewBox='0 0 110 126' fill='none' xmlns='http://www.w3.org/2000/svg'>
				<path
					d='M53.5 5.86603C54.4282 5.33013 55.5718 5.33013 56.5 5.86603L103.729 33.134C104.658 33.6699 105.229 34.6603 105.229 35.732V90.268C105.229 91.3397 104.658 92.3301 103.729 92.866L56.5 120.134C55.5718 120.67 54.4282 120.67 53.5 120.134L6.27053 92.866C5.34232 92.3301 4.77053 91.3397 4.77053 90.268V35.732C4.77053 34.6603 5.34232 33.6699 6.27053 33.134L53.5 5.86603Z'
					fill='black'
					fill-opacity='0.48'
				/>
				<path
					d='M53.5 5.86603C54.4282 5.33013 55.5718 5.33013 56.5 5.86603L103.729 33.134C104.658 33.6699 105.229 34.6603 105.229 35.732V90.268C105.229 91.3397 104.658 92.3301 103.729 92.866L56.5 120.134C55.5718 120.67 54.4282 120.67 53.5 120.134L6.27053 92.866C5.34232 92.3301 4.77053 91.3397 4.77053 90.268V35.732C4.77053 34.6603 5.34232 33.6699 6.27053 33.134L53.5 5.86603Z'
					fill='url(#paint0_radial_115_389)'
					fill-opacity='0.2'
				/>
				<path
					d='M52.25 2.16506C53.9517 1.18258 56.0483 1.18258 57.75 2.16506L106.31 30.201C108.011 31.1834 109.06 32.9991 109.06 34.9641V91.0359C109.06 93.0009 108.011 94.8166 106.31 95.799L57.75 123.835C56.0483 124.817 53.9517 124.817 52.25 123.835L3.6904 95.799C1.98869 94.8166 0.940399 93.0009 0.940399 91.0359V34.9641C0.940399 32.9991 1.98869 31.1834 3.6904 30.201L52.25 2.16506Z'
					stroke='white'
					stroke-opacity='0.4'
				/>
				<defs>
					<radialGradient id='paint0_radial_115_389' cx='0' cy='0' r='1' gradientUnits='userSpaceOnUse' gradientTransform='translate(55 5) rotate(90) scale(64.5)'>
						<stop stop-color='white' />
						<stop offset='1' stop-color='white' stop-opacity='0' />
					</radialGradient>
				</defs>
			</svg>

			<div className='relative'>
				<img className='w-28 h-[6.25rem] object-cover absolute top-0 bottom-0 my-auto opacity-[.1]' src='./images/logo.png' />
				<img className='w-20 h-[4.5rem] object-contain' src='./images/logo.png' />
			</div>
		</div>
	);
};
