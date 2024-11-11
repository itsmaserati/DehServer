import { statusIcons } from 'components/Icons';
import React from 'react';
import { hexToRGB } from 'utils/misc';
import * as FaIcons from 'react-icons/fa6';
import { CircularProgressbarWithChildren } from 'react-circular-progressbar';
import 'react-circular-progressbar/dist/styles.css';
import { motion as m } from 'framer-motion';
import { useData } from 'contexts/DataContext';
export default function Style4({ status, isInMove }) {
	return (
		<div className='flex items-center gap-x-0.5'>
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
			style={getPosition(item.name)}
			className='w-[2.8504rem] h-[2.8504rem] rounded-[100%] bg-black/25 p-[.215rem] relative'
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
				className='flex items-center justify-center'
			>
				{React.createElement(statusIcons[item.icon] ?? FaIcons[item.icon] ?? FaIcons['FaHeart'], {
					color: item.color,
					size: 18,
					style: { fontSize: 18 },
				})}
			</CircularProgressbarWithChildren>
		</m.div>
	);
};
