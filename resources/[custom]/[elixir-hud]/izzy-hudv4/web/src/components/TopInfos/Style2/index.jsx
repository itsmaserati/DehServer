import { Clock, DatePicker, topInfoIcons } from 'components/Icons';
import { useData } from 'contexts/DataContext';
import moment from 'moment';
import React from 'react';
import { formatter, hexToRGB } from 'utils/misc';
import Weapon from './Weapon';
import { AnimatePresence, motion as m } from 'framer-motion';

export default function Style2({ infos, weapon, isInMove }) {
	const { colors, serverNameBold, serverName, updatePosition, getPosition, time, useRealTime } = useData();
	return (
		<>
			<m.div drag={isInMove} dragMomentum={0} onDragEnd={(e) => updatePosition('topInfo', e)} whileDrag={{ cursor: 'grabbing' }} style={getPosition('topInfo')}>
				<div
					style={{ background: `radial-gradient(54.86% 47.21% at 100% 50%, rgba(${hexToRGB(colors.primary)}, 0.20) 0%, rgba(${hexToRGB(colors.primary)}, 0.00) 100%), rgba(0, 0, 0, 0.35)` }}
					className='pl-[.9375rem] h-16 flex items-center justify-end rounded-[.1875rem] gap-x-2'
				>
					<span style={{ color: colors.primary }} className='font-ow text-[1.5893rem] font-medium'>
						{serverNameBold} <span className='text-white'>{serverName}</span>
					</span>

					<img className='w-[3.375rem] h-[3.375rem] object-cover' src='./images/logo.png' />
					<div style={{ background: colors.primary }} className='w-px h-[1.875rem] rounded-[.1875rem]' />
				</div>

				<div className='flex flex-col items-end gap-y-2.5 mt-2.5'>
					{infos
						.filter((x) => !x.currency)
						.map((info) => (
							<div className='w-min p-2 bg-black/[.35] rounded-[.1875rem] flex items-center gap-x-1.5'>
								{topInfoIcons[info.id] && React.createElement(topInfoIcons[info.id])}
								<span className='font-gr-m text-sm text-white/50 whitespace-nowrap'>
									{info.secondValue} <span className='text-white'>{info.value}</span>
								</span>
							</div>
						))}
					{infos
						.filter((x) => x.currency)
						.map((info) => (
							<div
								style={{ background: `radial-gradient(58.93% 84.54% at 100% 50%, rgba(${hexToRGB(info.color)}, 0.2) 0%, rgba(${hexToRGB(info.color)}, 0) 100%), rgba(0, 0, 0, 0.35)` }}
								className='w-min p-2 h-10 rounded-[.1875rem] flex items-center gap-x-2.5'
							>
								<p style={{ color: info.color }} className='font-gr-sb whitespace-nowrap'>
									{formatter.format(info.value)}
								</p>
								<div className='relative top-px'>
									{React.createElement(topInfoIcons[info.icon] ?? FaIcons[info.icon] ?? FaIcons['FaHeart'] ?? topInfoIcons['cash'], {
										style: { color: info.color },
										size: '20',
										className: 'w-5 h-5',
									})}
								</div>
							</div>
						))}

					<div className='flex items-center gap-x-2'>
						<div className='w-min p-2 bg-black/[.35] rounded-[.1875rem] flex items-center gap-x-1.5'>
							<DatePicker size='20' />
							<span className='font-gr-m text-sm text-white/70 whitespace-nowrap'>{moment().format('L')}</span>
						</div>
						<div className='w-min p-2 bg-black/[.35] rounded-[.1875rem] flex items-center gap-x-1.5'>
							<Clock size='20' />
							<span className='font-gr-m text-sm text-white/70 whitespace-nowrap'>{useRealTime ? moment().format('LT') : time}</span>
						</div>
					</div>
				</div>
			</m.div>

			<AnimatePresence>{weapon?.label && <Weapon weapon={weapon} isInMove={isInMove} />}</AnimatePresence>
		</>
	);
}
