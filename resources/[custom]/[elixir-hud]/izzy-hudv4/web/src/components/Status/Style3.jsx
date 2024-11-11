import { statusIcons } from 'components/Icons';
import React from 'react';
import { hexToRGB } from 'utils/misc';
import * as FaIcons from 'react-icons/fa6';
import { motion as m } from 'framer-motion';
import { useData } from 'contexts/DataContext';
export default function Style3({ status, isInMove }) {
	return (
		<div className='flex items-center gap-x-[.6875rem]'>
			{status.map((item) => (
				<Bar key={item.name} item={item} isInMove={isInMove} />
			))}
		</div>
	);
}

const Bar = ({ item, isInMove }) => {
	const { updatePosition, getPosition } = useData();
	return (
		<m.div
			drag={isInMove}
			dragMomentum={0}
			onDragEnd={(e) => updatePosition(item.name, e)}
			whileDrag={{ cursor: 'grabbing' }}
			style={{
				background: `radial-gradient(45.2% 117.09% at 0% 50%, rgba(${hexToRGB(item.color)}, 0.27) 0%, rgba(${hexToRGB(item.color)}, 0) 100%), rgba(0, 0, 0, 0.45)`,
				...getPosition(item.name),
			}}
			className='w-[7.8125rem] h-10 rounded relative p-[.5625rem] flex items-center gap-x-[.6875rem] overflow-hidden'
		>
			<div style={{ border: `1px solid rgba(${hexToRGB(item.color)}, 0.15)` }} className='absolute left-0 top-0 w-full h-full rounded' />
			<div style={{ background: item.color }} className='absolute left-0 top-0 bottom-0 my-auto h-5 w-px rounded-lg' />

			{React.createElement(statusIcons[item.icon] ?? FaIcons[item.icon] ?? FaIcons['FaHeart'], {
				color: item.color,
				size: 22,
			})}

			<div className='flex flex-col gap-y-[.1875rem] mb-[.1875rem]'>
				<div className='w-full flex justify-between items-center relative'>
					<p className='font-gr-sb text-xs text-white/80 rounded-sm'>{item.label}</p>
					<p className='font-gr-sb text-[0.625rem] text-white'>{Math.floor(item.value)}%</p>
				</div>

				<div style={{ background: `rgba(${hexToRGB(item.color)}, 0.18)` }} className='w-[4.6875rem] h-[.3125rem] relative rounded-[.0625rem]'>
					<div style={{ background: item.color, width: item.value + '%' }} className='h-full rounded-[.0625rem] transition-all' />
				</div>
			</div>

			<div className='absolute -right-4 bottom-0 translate-y-3'>
				{React.createElement(statusIcons[item.icon] ?? FaIcons[item.icon] ?? FaIcons['FaHeart'], {
					color: `rgba(${hexToRGB(item.color)}, 0.10)`,
					size: 50,
				})}
			</div>
		</m.div>
	);
};
