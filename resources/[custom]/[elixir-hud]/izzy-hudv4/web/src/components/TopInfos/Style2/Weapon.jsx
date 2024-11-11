import { Ammo } from 'components/Icons';
import React from 'react';
import { motion as m } from 'framer-motion';
import { useData } from 'contexts/DataContext';

export default function Weapon({ weapon, isInMove }) {
	const { updatePosition, getPosition } = useData();
	return (
		<m.div
			drag={isInMove}
			dragMomentum={0}
			onDragEnd={(e) => updatePosition('weapon', e)}
			whileDrag={{ cursor: 'grabbing' }}
			style={getPosition('weapon')}
			initial={{ opacity: 0 }}
			animate={{ opacity: 1 }}
			exit={{ opacity: 0 }}
			className='mt-[.9375rem] flex items-center justify-end'
		>
			<div
				className='px-4 h-[3.5625rem] rounded-[.3125rem] flex items-center justify-end gap-x-4 pr-2'
				style={{ background: 'radial-gradient(58.93% 84.54% at 100% 50%, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0) 100%), rgba(0, 0, 0, 0.35)' }}
			>
				<div>
					<p className='text-white font-gr-sb text-end leading-5'>{weapon.label}</p>
					<span className='text-white text-xs font-gr-sb text-end flex items-center gap-x-[.1563rem]'>
						{weapon.current}
						<span className='font-gr-r text-white/50'>/{weapon.total}</span>
						<Ammo />
					</span>
				</div>

				<img style={{ transform: `rotateY(180deg) rotate(25.929deg)` }} src={`./weapons/${weapon.name}.png`} className='w-10 h-10 object-cover pointer-events-none' />
			</div>
		</m.div>
	);
}
