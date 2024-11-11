import { Location, statusIcons } from 'components/Icons';
import React from 'react';
import Wave from 'react-wavify';
import { hexToRGB } from 'utils/misc';
import * as FaIcons from 'react-icons/fa6';
import { useData } from 'contexts/DataContext';
import { motion as m } from 'framer-motion';

export default function Style5({ status, isInMove }) {
	const health = status.find((x) => x.name == 'health');
	const mic = status.find((x) => x.name == 'mic');
	const { location, updatePosition, getPosition } = useData();
	return (
		<>
			<m.div drag={isInMove} dragMomentum={0} onDragEnd={(e) => updatePosition('hud', e)} whileDrag={{ cursor: 'grabbing' }} style={getPosition('hud')} className='flex items-center'>
				{health && <HealthBar key={'health'} item={health} />}
				<div className='mt-1'>
					<div className='flex items-center gap-x-1 mb-1 -translate-x-2'>
						<Location />
						<p className='text-xs font-gr-m text-white/60'>{location.street}</p>
					</div>
					<Bars status={status} />
					{mic && (
						<div className='-translate-x-2'>
							<div className='flex items-center gap-x-[.1875rem] mt-[.1875rem]'>
								{Array.from({ length: 3 }).map((_, key) => (
									<div
										style={{ background: mic?.value < (key / 3) * 100 ? 'rgba(255, 255, 255, 0.3)' : mic.color }}
										className='w-[2.1875rem] h-0.5 relative rounded-sm transition-colors'
									/>
								))}
							</div>

							<div className='flex items-center mt-[.1875rem] gap-x-0.5'>
								{React.createElement(statusIcons[mic.icon] ?? FaIcons[mic.icon] ?? FaIcons['FaHeart'], {
									color: mic.color,
									size: 16,
								})}

								<p style={{ color: mic.color }} className='font-gr-sb text-xs transition-colors'>
									{mic.rangeLabel}
								</p>
							</div>
						</div>
					)}
				</div>
			</m.div>
		</>
	);
}

const HealthBar = ({ item }) => {
	return (
		<div className='w-[7.25rem] h-[7.25rem] relative flex items-center justify-center'>
			<svg className='absolute left-0 top-0' width='102' height='116' viewBox='0 0 102 116' fill='none' xmlns='http://www.w3.org/2000/svg'>
				<path
					d='M50.5857 1.19594C50.8421 1.04793 51.1579 1.04793 51.4143 1.19594L99.9866 29.2392C100.243 29.3872 100.401 29.6607 100.401 29.9568V86.0432C100.401 86.3393 100.243 86.6128 99.9866 86.7608L51.4143 114.804C51.1579 114.952 50.8421 114.952 50.5857 114.804L2.01339 86.7608C1.75702 86.6128 1.5991 86.3393 1.5991 86.0433V29.9568C1.5991 29.6607 1.75702 29.3872 2.01338 29.2392L50.5857 1.19594Z'
					stroke='#FF4646'
					stroke-width='1.65714'
				/>
			</svg>
			<svg className='absolute left-0.5 top-px' width='98' height='114' viewBox='0 0 98 114' fill='none' xmlns='http://www.w3.org/2000/svg'>
				<path
					d='M48.1715 1.1356C48.6842 0.839582 49.3159 0.839582 49.8287 1.1356L96.9659 28.3503C97.4786 28.6463 97.7944 29.1934 97.7944 29.7854V84.2148C97.7944 84.8068 97.4786 85.3539 96.9659 85.6499L49.8287 112.865C49.3159 113.161 48.6842 113.161 48.1715 112.865L1.03431 85.6499C0.521587 85.3539 0.205738 84.8068 0.205738 84.2148V29.7854C0.205738 29.1934 0.521588 28.6463 1.03431 28.3503L48.1715 1.1356Z'
					fill='black'
					fill-opacity='0.4'
				/>
			</svg>
			<svg width='0' height='0'>
				<defs>
					<clipPath id='healthClip'>
						<path
							d='M43.1718 0.764509C43.6846 0.468489 44.3163 0.468489 44.829 0.764509L86.2257 24.6649C86.7384 24.9609 87.0543 25.508 87.0543 26.1V73.9008C87.0543 74.4928 86.7384 75.0399 86.2257 75.3359L44.829 99.2363C44.3163 99.5323 43.6846 99.5323 43.1718 99.2363L1.77516 75.3359C1.26243 75.0399 0.946583 74.4928 0.946583 73.9008V26.1C0.946583 25.508 1.26243 24.9609 1.77515 24.6649L43.1718 0.764509Z'
							fill='#FF4646'
							fill-opacity='0.18'
						/>
					</clipPath>
				</defs>
			</svg>

			<div
				style={{ background: `rgba(${hexToRGB(item.color)}, 0.18)`, clipPath: 'url(#healthClip)' }}
				className='w-[6.2143rem] h-[6.2143rem] relative mr-0.5 flex items-center justify-center overflow-hidden'
			>
				<Wave
					fill={item.color}
					paused={false}
					options={{
						height: ((100 - item.value) / 130) * 99.429,
						amplitude: 3,
						speed: 0.2,
						points: 2,
					}}
					className='absolute top-0 left-0 transition-all'
				/>

				<svg className='relative right-1.5 top-px' width='48' height='48' viewBox='0 0 48 48' fill='none' xmlns='http://www.w3.org/2000/svg'>
					<path
						fill-rule='evenodd'
						clip-rule='evenodd'
						d='M18.1269 36.5075C12.4371 32.1478 4.66699 24.9462 4.66699 18.137C4.66699 6.76124 15.3003 2.51371 24.0003 11.2988C32.7003 2.51371 43.3337 6.76124 43.3337 18.137C43.3337 24.9462 35.5617 32.1478 29.8738 36.5075C27.2986 38.4795 26.011 39.4674 24.0003 39.4674C21.9897 39.4674 20.7021 38.4814 18.1269 36.5075ZM32.7003 12.8841C33.0849 12.8841 33.4537 13.0369 33.7256 13.3088C33.9976 13.5807 34.1503 13.9495 34.1503 14.3341V16.7508H36.567C36.9516 16.7508 37.3204 16.9035 37.5923 17.1755C37.8642 17.4474 38.017 17.8162 38.017 18.2008C38.017 18.5853 37.8642 18.9542 37.5923 19.2261C37.3204 19.498 36.9516 19.6508 36.567 19.6508H34.1503V22.0674C34.1503 22.452 33.9976 22.8208 33.7256 23.0927C33.4537 23.3647 33.0849 23.5174 32.7003 23.5174C32.3158 23.5174 31.9469 23.3647 31.675 23.0927C31.4031 22.8208 31.2503 22.452 31.2503 22.0674V19.6508H28.8337C28.4491 19.6508 28.0803 19.498 27.8084 19.2261C27.5364 18.9542 27.3837 18.5853 27.3837 18.2008C27.3837 17.8162 27.5364 17.4474 27.8084 17.1755C28.0803 16.9035 28.4491 16.7508 28.8337 16.7508H31.2503V14.3341C31.2503 13.9495 31.4031 13.5807 31.675 13.3088C31.9469 13.0369 32.3158 12.8841 32.7003 12.8841Z'
						fill='#FF9E9E'
					/>
				</svg>
			</div>
		</div>
	);
};

const Bars = ({ status }) => {
	const armor = status.find((x) => x.name == 'armor');
	return (
		<div className='-translate-x-[15px]'>
			<svg width='0' height='0'>
				<defs>
					<clipPath id='barsClip'>
						<path
							d='M0 5C0 2.23858 2.23858 0 5 0H197.668C199.749 0 201.612 1.28868 202.346 3.23562L220.449 51.2356C221.682 54.5058 219.266 58 215.771 58H5C2.23858 58 0 55.7614 0 53V5Z'
							fill='black'
							fill-opacity='0.4'
						/>
					</clipPath>
				</defs>
			</svg>

			<div style={{ clipPath: 'url(#barsClip)' }} className='w-[13.9375rem] h-[3.625rem] p-[.4375rem] px-[.625rem] pr-[1.8438rem] bg-black/40 relative flex items-center gap-x-[.5787rem]'>
				{armor && <ArmorBar key={'armor'} item={armor} />}
				{status
					.filter((x) => x.name !== 'health' && x.name !== 'armor' && x.name !== 'mic')
					.map((item) => (
						<Bar key={item.name} item={item} />
					))}
			</div>
		</div>
	);
};

const ArmorBar = ({ item }) => {
	return (
		<div className='w-[2.375rem] h-[2.75rem] relative'>
			<svg width='38' height='44' viewBox='0 0 38 44' fill='none' xmlns='http://www.w3.org/2000/svg'>
				<path
					d='M18.6201 1.36595C18.979 1.15873 19.4212 1.15873 19.7801 1.36595L36.7796 11.1806C37.1385 11.3878 37.3596 11.7708 37.3596 12.1852V31.8146C37.3596 32.229 37.1385 32.6119 36.7796 32.8192L19.7801 42.6338C19.4212 42.841 18.979 42.841 18.6201 42.6338L1.62057 32.8192C1.26166 32.6119 1.04057 32.229 1.04057 31.8146V12.1852C1.04057 11.7708 1.26166 11.3878 1.62057 11.1806L18.6201 1.36595Z'
					stroke='white'
					stroke-width='0.994286'
				/>
				<mask id='mask0_115_389' style={{ maskType: 'alpha' }} maskUnits='userSpaceOnUse' x='4' y='5' width='30' height='34'>
					<path
						d='M18.3718 5.90709C18.8845 5.61107 19.5162 5.61107 20.0289 5.90709L32.723 13.236C33.2358 13.5321 33.5516 14.0791 33.5516 14.6712V29.3291C33.5516 29.9211 33.2358 30.4682 32.723 30.7642L20.0289 38.0932C19.5162 38.3892 18.8845 38.3892 18.3718 38.0932L5.67763 30.7642C5.16491 30.4682 4.84906 29.9211 4.84906 29.3291V14.6712C4.84906 14.0791 5.16491 13.5321 5.67763 13.236L18.3718 5.90709Z'
						fill='#D9D9D9'
					/>
				</mask>
				<path
					d='M18.3718 5.90709C18.8845 5.61107 19.5162 5.61107 20.0289 5.90709L32.723 13.236C33.2358 13.5321 33.5516 14.0791 33.5516 14.6712V29.3291C33.5516 29.9211 33.2358 30.4682 32.723 30.7642L20.0289 38.0932C19.5162 38.3892 18.8845 38.3892 18.3718 38.0932L5.67763 30.7642C5.16491 30.4682 4.84906 29.9211 4.84906 29.3291V14.6712C4.84906 14.0791 5.16491 13.5321 5.67763 13.236L18.3718 5.90709Z'
					fill='white'
					fill-opacity='0.15'
				/>
			</svg>

			<svg width='0' height='0'>
				<defs>
					<clipPath id='armorClip'>
						<path
							d='M18.3718 5.90709C18.8845 5.61107 19.5162 5.61107 20.0289 5.90709L32.723 13.236C33.2358 13.5321 33.5516 14.0791 33.5516 14.6712V29.3291C33.5516 29.9211 33.2358 30.4682 32.723 30.7642L20.0289 38.0932C19.5162 38.3892 18.8845 38.3892 18.3718 38.0932L5.67763 30.7642C5.16491 30.4682 4.84906 29.9211 4.84906 29.3291V14.6712C4.84906 14.0791 5.16491 13.5321 5.67763 13.236L18.3718 5.90709Z'
							fill='white'
							fill-opacity='0.15'
						/>
					</clipPath>
				</defs>
			</svg>

			<div style={{ clipPath: 'url(#armorClip)' }} className='w-[2.0714rem] h-[2.4rem] flex items-center justify-center overflow-hidden absolute left-0 top-0'>
				<Wave
					fill='#FFFFFF'
					paused={false}
					options={{
						height: ((100 - item.value) / 100) * 38.4,
						amplitude: 3,
						speed: 0.2,
						points: 2,
					}}
					className='absolute top-0 left-0 transition-all'
				/>

				<svg className='relative top-[.1875rem] left-0.5' width='18' height='18' viewBox='0 0 18 18' fill='none' xmlns='http://www.w3.org/2000/svg'>
					<path
						d='M9.19959 15.9043C7.59999 15.5015 6.27934 14.5836 5.23764 13.1506C4.19594 11.7177 3.67532 10.1268 3.67578 8.37806V4.16616L9.19959 2.09473L14.7234 4.16616V8.37806C14.7234 10.1273 14.2028 11.7184 13.1615 13.1513C12.1203 14.5843 10.7997 15.5019 9.19959 15.9043Z'
						fill='#8F8F8F'
					/>
				</svg>
			</div>
		</div>
	);
};

const Bar = ({ item }) => {
	return (
		<div className='w-[1.625rem] h-[2.25rem] rounded bg-white/[.07] relative flex flex-col items-center justify-center pt-[.1875rem]'>
			<div className='w-4 h-4 relative flex items-center justify-center'>
				{React.createElement(statusIcons[item.icon] ?? FaIcons[item.icon] ?? FaIcons['FaHeart'], {
					color: '#FFFFFFA8',
					size: 16,
				})}
			</div>

			<p className='font-gr-sb text-center text-white text-[.625rem]'>{Math.floor(item.value)}</p>
		</div>
	);
};
