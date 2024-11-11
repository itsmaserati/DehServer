import React from 'react';
import { motion as m } from 'framer-motion';
import { useLang } from 'contexts/LangContext';
import { useData } from 'contexts/DataContext';
import classNames from 'classnames';
export default function StatusTypes() {
	const { lang } = useLang();
	const { statusStyle, update } = useData();
	return (
		<m.div
			initial={{ opacity: 0, x: -10, y: -10 }}
			animate={{ opacity: 1, x: 0, y: 0 }}
			exit={{ opacity: 0, x: -10, y: -10 }}
			transition={{ type: 'tween' }}
			className='absolute left-0 top-0 px-[4.8125rem] pt-[7.125rem] w-full h-full'
		>
			<p className='text-white text-[1.875rem] font-gr-sb'>{lang.statusTypes}</p>
			<p className='text-white/[.54] text-xl font-gr-r w-[36.3125rem] leading-[1.6375rem]'>{lang.pageDescription}</p>
			<div className='mt-[1.0625rem] w-[22.6875rem] h-px bg-white/[.19]' />
			<div className='mt-[2.1612rem] w-[40.375rem] max-h-full grid grid-cols-2 gap-2.5 relative'>
				<div
					onClick={(e) => update({ statusStyle: 1 })}
					className={classNames(
						'w-full h-[10.5rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-4 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': statusStyle == 1,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 1</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-3 w-72' src='./images/status1.png' />
				</div>
				<div
					onClick={(e) => update({ statusStyle: 2 })}
					className={classNames(
						'w-full h-[10.5rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-4 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': statusStyle == 2,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 2</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-1 w-32 object-contain' src='./images/status2.png' />
				</div>
				<div
					onClick={(e) => update({ statusStyle: 3 })}
					className={classNames(
						'w-full h-[10.5rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-4 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': statusStyle == 3,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 3</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-3 w-72 object-contain' src='./images/status3.png' />
				</div>
				<div
					onClick={(e) => update({ statusStyle: 4 })}
					className={classNames(
						'w-full h-[10.5rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-4 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': statusStyle == 4,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 4</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-5 w-72 object-contain' src='./images/status4.png' />
				</div>
				<div
					onClick={(e) => update({ statusStyle: 5 })}
					className={classNames(
						'col-span-2 w-full h-[10.5rem] rounded bg-black/[.12] hover:bg-black/20 border border-transparent flex flex-col items-center pt-2 transition-colors duration-300 select-none cursor-pointer',
						{
							'!border-white': statusStyle == 5,
						}
					)}
				>
					<p className='text-white text-[1.1979rem] font-br font-semibold'>{lang.type} 5</p>
					<p className='text-white/[.66] text-[.8984rem] font-br font-medium w-[12.6383rem] text-center leading-[1.0243rem]'>{lang.typeDescription}</p>
					<img className='mt-3 w-52 object-contain' src='./images/status5.png' />
				</div>
			</div>
		</m.div>
	);
}
