import { statusIcons } from 'components/Icons';
import React from 'react';
import { hexToRGB } from 'utils/misc';
import * as FaIcons from 'react-icons/fa6';
import { CircularProgressbarWithChildren } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';
import { motion as m } from 'framer-motion';
import { useData } from 'contexts/DataContext';
export default function Style2({ status, isInMove }) {
	const health = status.find((x) => x.name == 'health');
	const armor = status.find((x) => x.name == 'armor');
	const { updatePosition, getPosition, location } = useData();
	return (
		<div style={{ left: location.inVehicle ? '10rem' : 0 }}>
			{health && (
				<m.div
					drag={isInMove}
					dragMomentum={0}
					onDragEnd={(e) => updatePosition('health', e)}
					whileDrag={{ cursor: 'grabbing' }}
					style={{
						background: `radial-gradient(18.88% 114.65% at 0% 50%, rgba(${hexToRGB(health.color)}, 0.27) 0%, rgba(255, 70, 70, 0) 100%), rgba(0, 0, 0, 0.4)`,
						...getPosition('health'),
					}}
					className='w-[14.5625rem] h-[1.9375rem] rounded-[.4375rem] flex items-center gap-x-2.5 p-1.5 pl-2.5 pr-[.6875rem]'
				>
					{React.createElement(statusIcons[health.icon] ?? FaIcons[health.icon] ?? FaIcons['FaHeart'], {
						color: health.color,
						size: 18,
					})}

					<div style={{ background: `rgba(${hexToRGB(health.color)}, 0.18)` }} className='w-full h-[.4375rem] rounded-full'>
						<div style={{ width: health.value + '%', background: health.color }} className='h-full rounded-full transition-all' />
					</div>
				</m.div>
			)}

			{armor && (
				<m.div
					drag={isInMove}
					dragMomentum={0}
					onDragEnd={(e) => updatePosition('armor', e)}
					whileDrag={{ cursor: 'grabbing' }}
					style={{
						background: `radial-gradient(18.88% 114.65% at 0% 50%, rgba(${hexToRGB(armor.color)}, 0.27) 0%, rgba(255, 70, 70, 0) 100%), rgba(0, 0, 0, 0.4)`,
						...getPosition('armor'),
					}}
					className='w-[14.5625rem] h-[1.9375rem] rounded-[.4375rem] flex items-center gap-x-[.5625rem] p-1.5 pr-[.6875rem] mt-[.6875rem]'
				>
					{React.createElement(statusIcons[armor.icon] ?? FaIcons[armor.icon] ?? FaIcons['FaHeart'], {
						color: armor.color,
						size: 23,
					})}

					<div style={{ background: `rgba(${hexToRGB(armor.color)}, 0.18)` }} className='w-full h-[.4375rem] rounded-full'>
						<div style={{ width: armor.value + '%', background: armor.color }} className='h-full rounded-full transition-all' />
					</div>
				</m.div>
			)}

			<div className='flex items-center gap-x-1'>
				{status
					.filter((x) => x.name !== 'health' && x.name !== 'armor')
					.map((item) => (
						<Bar key={item.name} item={item} isInMove={isInMove} />
					))}
			</div>
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
			style={getPosition(item.name)}
			className='w-10 h-10 relative flex items-center justify-center p-0.5 bg-black/[.25] rounded-[100%] mt-1.5'
		>
			<CircularProgressbarWithChildren
				styles={{
					trail: {
						stroke: `rgba(${hexToRGB(item.color)}, 0.31)`,
						strokeWidth: 8,
					},
					path: {
						stroke: item.color,
						strokeLinecap: 'butt',
					},
				}}
				strokeWidth={8}
				value={item.value}
				className='flex items-center justify-center relative'
			>
				<div
					style={{ background: item.color, filter: `drop-shadow(0px 0px 2.288px rgba(${hexToRGB(item.color)}, 0.38))` }}
					className='w-6 h-6 relative rounded-[100%] flex items-center justify-center'
				>
					{React.createElement(statusIcons[item.icon] ?? FaIcons[item.icon] ?? FaIcons['FaHeart'], {
						color: item.name == 'mic' && item.color == '#FFFFFF' ? '#000000' : item.name !== 'mic' ? '#FFFFFF' : item.color,
						size: 16,
					})}
				</div>
			</CircularProgressbarWithChildren>
		</m.div>
	);
};
