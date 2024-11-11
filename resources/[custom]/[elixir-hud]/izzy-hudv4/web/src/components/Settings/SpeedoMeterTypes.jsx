import React from 'react';
import { motion as m } from 'framer-motion';
import { useLang } from 'contexts/LangContext';
import classNames from 'classnames';
import { useData } from 'contexts/DataContext';
export default function SpeedoMeterTypes() {
	const { lang } = useLang();
	const { update, carhudStyle } = useData();
	return (
		<m.div
			initial={{ opacity: 0, x: -15, y: -15 }}
			animate={{ opacity: 1, x: 0, y: 0 }}
			exit={{ opacity: 0, x: -15, y: -15 }}
			transition={{ type: 'tween' }}
			className='absolute left-0 top-0 px-[4.8125rem] pt-[7.125rem] w-full h-full'
		>
			<p className='text-white text-[1.875rem] font-gr-sb'>{lang.speedoMeter}</p>
			<p className='text-white/[.54] text-xl font-gr-r w-[36.3125rem] leading-[1.6375rem]'>{lang.pageDescription}</p>
			<div className='mt-[1.0625rem] w-[22.6875rem] h-px bg-white/[.19]' />
			<div className='mt-[2.1612rem] w-[40.375rem] max-h-full grid grid-cols-2 gap-2.5 relative'>
				<div
					onClick={(e) => update({ carhudStyle: 1 })}
					className={classNames(
						'w-full h-[16.1489rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-4 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': carhudStyle == 1,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 1</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-6 w-72' src='./images/carhud1.png' />
				</div>
				<div
					onClick={(e) => update({ carhudStyle: 2 })}
					className={classNames(
						'w-full h-[16.1489rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-4 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': carhudStyle == 2,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 2</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-4 w-40 object-contain' src='./images/carhud2.png' />
				</div>
				<div
					onClick={(e) => update({ carhudStyle: 3 })}
					className={classNames(
						'col-span-2 w-full h-[12.1489rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-4 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': carhudStyle == 3,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 3</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-3 w-60 object-contain' src='./images/carhud3.png' />
				</div>
			</div>
		</m.div>
	);
}
