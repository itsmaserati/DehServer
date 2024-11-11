import { Ammo } from 'components/Icons';
import React from 'react';
import { motion as m } from 'framer-motion';
import { useData } from 'contexts/DataContext';

export default function Weapon({ weapon, isInMove }) {
	const { getPosition, updatePosition } = useData();
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
			className='flex items-center justify-end mt-[.9375rem]'
		>
			<Infos weapon={weapon} />
			<Image name={weapon.name} />
		</m.div>
	);
}

const Infos = ({ weapon }) => {
	return (
		<>
			<svg width='0' height='0'>
				<defs>
					<clipPath id='weaponClip'>
						<path d='M0.82708 0H94.9991L88.7264 3.88889V36.1111L94.9991 40H9.99964L0.82708 0Z' />
					</clipPath>
				</defs>
			</svg>

			<div
				className='w-[5.8857rem] h-10 pl-[1.0106rem] pr-4 pt-0.5 flex flex-col items-end justify-center relative translate-x-[.5625rem]'
				style={{ clipPath: 'url(#weaponClip)', background: 'linear-gradient(90deg, rgba(0, 0, 0, 0.48) -40.16%, rgba(0, 0, 0, 0.48) 101.66%)' }}
			>
				<p className='text-[.6875rem] whitespace-nowrap font-gr-sb text-white leading-3'>{weapon.label}</p>
				<div className='flex items-center justify-end gap-x-0.5'>
					<Ammo />
					<span className='font-gr-sb text-[.6875rem] text-white relative top-px'>
						{weapon.current}
						<span className='font-gr-r text-white/50'>/{weapon.total}</span>
					</span>
				</div>
			</div>
		</>
	);
};

const Image = ({ name }) => {
	return (
		<div className='w-[4.375rem] h-20 relative flex items-center justify-center'>
			<svg className='absolute left-0 top-0' width='70' height='80' viewBox='0 0 70 80' fill='none' xmlns='http://www.w3.org/2000/svg'>
				<path
					d='M34.0478 3.72466C34.6372 3.38441 35.3632 3.38441 35.9526 3.72466L65.9396 21.0376C66.5289 21.3779 66.8919 22.0067 66.8919 22.6872V57.3132C66.8919 57.9937 66.5289 58.6225 65.9396 58.9628L35.9526 76.2757C35.3632 76.616 34.6372 76.616 34.0478 76.2757L4.06085 58.9628C3.47152 58.6225 3.10847 57.9937 3.10847 57.3132V22.6872C3.10847 22.0067 3.47152 21.3779 4.06085 21.0376L34.0478 3.72466Z'
					fill='black'
					fill-opacity='0.48'
				/>
				<path
					d='M34.0478 3.72466C34.6372 3.38441 35.3632 3.38441 35.9526 3.72466L65.9396 21.0376C66.5289 21.3779 66.8919 22.0067 66.8919 22.6872V57.3132C66.8919 57.9937 66.5289 58.6225 65.9396 58.9628L35.9526 76.2757C35.3632 76.616 34.6372 76.616 34.0478 76.2757L4.06085 58.9628C3.47152 58.6225 3.10847 57.9937 3.10847 57.3132V22.6872C3.10847 22.0067 3.47152 21.3779 4.06085 21.0376L34.0478 3.72466Z'
					fill='url(#paint0_radial_115_389)'
					fill-opacity='0.2'
				/>
				<path
					d='M33.254 1.37464C34.3344 0.750846 35.6656 0.750846 36.746 1.37464L67.5775 19.1752C68.658 19.799 69.3236 20.9518 69.3236 22.1994V57.8006C69.3236 59.0482 68.658 60.201 67.5775 60.8248L36.746 78.6254C35.6656 79.2492 34.3344 79.2492 33.254 78.6254L2.42247 60.8248C1.34202 60.201 0.676443 59.0482 0.676443 57.8006V22.1994C0.676443 20.9518 1.34203 19.799 2.42247 19.1752L33.254 1.37464Z'
					stroke='white'
					stroke-opacity='0.4'
					stroke-width='0.634921'
				/>
				<defs>
					<radialGradient id='paint0_radial_115_389' cx='0' cy='0' r='1' gradientUnits='userSpaceOnUse' gradientTransform='translate(35.0002 3.1748) rotate(90) scale(40.9524)'>
						<stop stop-color='white' />
						<stop offset='1' stop-color='white' stop-opacity='0' />
					</radialGradient>
				</defs>
			</svg>

			<img style={{ transform: `rotateY(180deg) rotate(25.929deg)` }} src={`./weapons/${name}.png`} className='w-10 h-10 object-cover pointer-events-none' />
		</div>
	);
};
