import React from 'react';
import { hexToRGB } from 'utils/misc';
import * as FaIcons from 'react-icons/fa6';
import { Microphone, statusIcons } from 'components/Icons';
import Wave from 'react-wavify';
import { useData } from 'contexts/DataContext';
import { motion as m } from 'framer-motion';
export default function Style1({ status, isInMove }) {
	const { mapType, location, updatePosition, getPosition } = useData();
	const health = status.find((x) => x.name == 'health');
	const armor = status.find((x) => x.name == 'armor');
	const mic = status.find((x) => x.name == 'mic');
	const length = 284;
	const healthOffset = length - (length * health?.value) / 100;
	const armorOffset = length - (length * armor?.value) / 100;

	return (
		<div>
			{mapType == 'circle' && location.inVehicle ? (
				<div className='relative left-2 top-6'>
					<div className='absolute top-1 left-1/2 -translate-x-1/2 w-[4.5625rem] h-[1.3125rem] rounded-[.1875rem] bg-black/[.63] flex items-center justify-center'>
						<p className='text-xs text-white/80 font-gr-sb'>{location.direction}</p>
					</div>
					<div className='absolute bottom-1 left-1/2 -translate-x-1/2 w-[4.8rem] ml-px h-[1.5rem] rounded-[.1875rem] bg-black/[.63] flex items-center justify-center gap-x-[.4375rem]'>
						<Microphone />
						<div className='flex items-center gap-x-1'>
							{Array.from({ length: 3 }).map((_, key) => (
								<div
									style={{ background: mic?.value >= (key / 3) * 100 ? mic.color : `rgba(${hexToRGB(mic.color)}, 0.16)` }}
									className='w-2.5 h-2.5 rounded-[0.1875rem] transition-colors'
								/>
							))}
						</div>
					</div>
					<svg width='320' height='320' viewBox='0 0 230 239' fill='none' xmlns='http://www.w3.org/2000/svg'>
						<path
							d='M82.7354 226.252C59.9246 219.39 39.8958 205.434 25.5586 186.411C11.2214 167.388 3.32255 144.29 3.00966 120.471C2.69677 96.6526 9.98609 73.3546 23.8187 53.9618C37.6512 34.569 57.3066 20.0915 79.9292 12.6325'
							stroke='#FF3535'
							stroke-opacity='0.38'
							stroke-width='3'
							stroke-linecap='round'
						/>
						<path
							d='M82.7704 226.263C59.9625 219.409 39.9329 205.464 25.59 186.453C11.2471 167.441 3.33781 144.352 3.01057 120.539C2.68334 96.7259 9.95522 73.4285 23.7703 54.0297C37.5853 34.631 57.2242 20.1409 79.8352 12.6636'
							stroke='#FF3535'
							stroke-width='5'
							stroke-linecap='round'
							strokeDasharray={length}
							strokeDashoffset={healthOffset}
							className='transition-all'
						/>
						<path
							d='M149.129 225.673C171.805 218.418 191.579 204.126 205.581 184.872C219.584 165.617 227.086 142.4 226.999 118.593C226.913 94.7847 219.242 71.6239 205.1 52.4713C190.957 33.3187 171.08 19.1709 148.352 12.0812'
							stroke='#2670FF'
							stroke-opacity='0.38'
							stroke-width='3'
							stroke-linecap='round'
						/>
						<path
							d='M148.788 225.782C171.594 218.566 191.49 204.237 205.564 184.895C219.637 165.553 227.149 142.213 226.998 118.293C226.847 94.3733 219.042 71.1301 204.725 51.9671C190.409 32.8041 170.333 18.728 147.438 11.8002'
							stroke='#2670FF'
							stroke-width='5'
							stroke-linecap='round'
							strokeDasharray={length}
							strokeDashoffset={armorOffset}
							className='transition-all'
						/>
						<defs>
							<filter id='filter0_b_3820_1473' x='70.2' y='-15.8' width='88.6' height='52.6' filterUnits='userSpaceOnUse' color-interpolation-filters='sRGB'>
								<feFlood flood-opacity='0' result='BackgroundImageFix' />
								<feGaussianBlur in='BackgroundImageFix' stdDeviation='7.9' />
								<feComposite in2='SourceAlpha' operator='in' result='effect1_backgroundBlur_3820_1473' />
								<feBlend mode='normal' in='SourceGraphic' in2='effect1_backgroundBlur_3820_1473' result='shape' />
							</filter>
							<filter id='filter1_b_3820_1473' x='65.2' y='199.2' width='98.6' height='55.6' filterUnits='userSpaceOnUse' color-interpolation-filters='sRGB'>
								<feFlood flood-opacity='0' result='BackgroundImageFix' />
								<feGaussianBlur in='BackgroundImageFix' stdDeviation='7.9' />
								<feComposite in2='SourceAlpha' operator='in' result='effect1_backgroundBlur_3820_1473' />
								<feBlend mode='normal' in='SourceGraphic' in2='effect1_backgroundBlur_3820_1473' result='shape' />
							</filter>
						</defs>
					</svg>
				</div>
			) : (
				<div className='flex items-center w-[15.1875rem] gap-x-[.4375rem]'>
					{health && (
						<m.div
							drag={isInMove}
							dragMomentum={0}
							onDragEnd={(e) => updatePosition('health', e)}
							whileDrag={{ cursor: 'grabbing' }}
							style={{ background: `rgba(${hexToRGB(health?.color)}, 0.38)`, ...getPosition('health') }}
							className='w-full h-0.5 flex items-center pointer-events-none'
						>
							<div style={{ background: health?.color, width: health?.value + '%' }} className='h-1 transition-all' />
						</m.div>
					)}

					{armor && (
						<m.div
							drag={isInMove}
							dragMomentum={0}
							onDragEnd={(e) => updatePosition('armor', e)}
							whileDrag={{ cursor: 'grabbing' }}
							style={{ background: `rgba(${hexToRGB(armor?.color)}, 0.38)`, ...getPosition('armor') }}
							className='w-full h-0.5 flex items-center pointer-events-none'
						>
							<div style={{ background: armor?.color, width: armor?.value + '%' }} className='h-1 transition-all' />
						</m.div>
					)}
				</div>
			)}

			<div className='mt-[1.1875rem] flex items-center gap-x-[.6875rem]'>
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
			className='w-8 h-8 rounded bg-black/40 p-[.1875rem] relative'
		>
			<div style={{ background: `rgba(${hexToRGB(item.color)}, 0.12)` }} className='w-full h-full flex justify-center items-center relative overflow-hidden'>
				<Wave
					fill={item.color}
					paused={false}
					options={{
						height: ((100 - item.value) / 130) * 32,
						amplitude: 3,
						speed: 0.2,
						points: 2,
					}}
					className='absolute top-0 left-0'
				/>

				<div className='relative z-10'>
					{React.createElement(statusIcons[item.icon] ?? FaIcons[item.icon] ?? FaIcons['FaHeart'], {
						color: item.name == 'mic' && item.color == '#FFFFFF' ? '#000000' : item.name !== 'mic' ? '#FFFFFF' : item.color,
					})}
				</div>
			</div>
		</m.div>
	);
};
