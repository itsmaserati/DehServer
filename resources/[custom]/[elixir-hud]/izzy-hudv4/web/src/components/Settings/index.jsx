import React, { useState } from 'react';
import { AnimatePresence, motion as m } from 'framer-motion';
import { useLang } from 'contexts/LangContext';
import { Arrow, DefaultAll, MoveIt, Save, SpeedoMeterIcon, StatusIcon } from 'components/Icons';
import classNames from 'classnames';
import { useData } from 'contexts/DataContext';
import Range from 'components/Range';
import StatusTypes from './StatusTypes';
import SpeedoMeterTypes from './SpeedoMeterTypes';
import { fetchNui } from 'utils/fetchNui';

export default function Settings({ isInMove, setIsInMove }) {
	const { lang } = useLang();
	const { data, update } = useData();
	const [activePage, setActivePage] = useState('statusTypes');
	const [menus, setMenus] = useState([
		{
			id: 'statusTypes',
			type: 'page',
			label: lang.statusTypes,
			icon: <StatusIcon />,
		},
		{
			id: 'statusSize',
			type: 'range',
			label: lang.statusSize,
			icon: <StatusIcon />,
		},
		{
			id: 'topInfoStyle',
			type: 'select',
			label: lang.topInfoStyle,
			icon: <StatusIcon />,
			on: { value: 1, label: lang.type + ' 1' },
			off: { value: 2, label: lang.type + '2' },
		},
		{
			id: 'speedoMeter',
			type: 'page',
			label: lang.speedoMeter,
			icon: <SpeedoMeterIcon />,
		},
		{
			id: 'carhudSize',
			type: 'range',
			label: lang.speedoMeterSize,
			icon: <SpeedoMeterIcon />,
		},
		{
			id: 'speedType',
			type: 'select',
			label: lang.speedType,
			icon: <SpeedoMeterIcon />,
			on: { value: 'kmh', label: lang.kmh },
			off: { value: 'mph', label: lang.mph },
		},
		{
			id: 'mapType',
			type: 'select',
			label: lang.mapType,
			icon: <SpeedoMeterIcon />,
			on: { value: 'circle', label: lang.circle },
			off: { value: 'square', label: lang.square },
		},
		{
			id: 'mapVisibility',
			type: 'select',
			label: lang.mapVisibility,
			icon: <SpeedoMeterIcon />,
			on: { value: 'always', label: lang.always },
			off: { value: 'vehicle', label: lang.onlyVehicle },
		},
	]);
	return (
		<m.div
			initial={{ opacity: 0 }}
			animate={{ opacity: 1 }}
			exit={{ opacity: 0 }}
			transition={{ duration: 0.6 }}
			className={classNames('absolute left-0 top-0 w-full h-full overflow-hidden bg-black/50', {
				'-z-10': isInMove,
			})}
		>
			{!isInMove && (
				<>
					<m.div
						className='absolute top-0 left-[11.1875rem] w-full h-full flex'
						initial={{ opacity: 0, y: '-100%' }}
						animate={{ opacity: 1, y: '0%' }}
						exit={{ opacity: 0, y: '-100%' }}
						transition={{ duration: 0.6 }}
					>
						<div
							className='min-w-[56.6875rem] h-full p-[5.625rem] flex flex-col justify-between'
							style={{ background: 'radial-gradient(145.41% 169.65% at -5.59% 45.56%, rgba(0, 0, 0, 0.74) 0%, rgba(0, 0, 0, 0.00) 100%)' }}
						>
							<div>
								<p className='font-ac text-white text-[3.75rem] leading-[3.125rem]'>{lang.hudSettings}</p>
								<p className='font-ac text-white/50 text-[1.625rem]'>{lang.chooseSettings}</p>
								<div className='w-full h-px bg-white/[.44] mt-3' />
								<div className='w-full mt-10 flex flex-col gap-y-[.6875rem] relative'>
									{menus.map((menu) => (
										<Item key={menu.id} menu={menu} setActivePage={setActivePage} activePage={activePage} />
									))}
								</div>
							</div>

							<div
								onClick={(e) => fetchNui('save', data)}
								className='w-full h-[3.3125rem] rounded-[.3125rem] bg-[#ADFFA6]/[.14] hover:bg-[#ADFFA6]/20 transition-colors duration-300 flex items-center justify-center gap-x-[.4375rem] select-none cursor-pointer'
							>
								<Save />
								<p className='font-gr-m text-[#ADFFA699]'>{lang.saveSettings}</p>
							</div>
						</div>

						<div className='relative w-full h-full'>
							<AnimatePresence>{activePage == 'statusTypes' && <StatusTypes />}</AnimatePresence>
							<AnimatePresence>{activePage == 'speedoMeter' && <SpeedoMeterTypes />}</AnimatePresence>
						</div>
					</m.div>
					<m.div
						initial={{ opacity: 0, x: '100%' }}
						animate={{ opacity: 1, x: 0 }}
						exit={{ opacity: 0, x: '100%' }}
						transition={{ duration: 0.6 }}
						className='absolute bottom-[3.75rem] right-[3.3125rem] flex items-center gap-x-4'
					>
						<div
							onClick={(e) => {
								fetchNui('defaultAll');
								localStorage.clear();
							}}
							className='w-[9.9375rem] h-[2.75rem] relative flex flex-col items-center select-none cursor-pointer group'
						>
							<div className='w-full h-px bg-white/[.37]' />
							<div className='w-[9.0625rem] group-hover:w-full h-full bg-white/[.04] group-hover:bg-white/5 flex items-center justify-center gap-x-[.3038rem] transition-all duration-500'>
								<DefaultAll />
								<p className='font-gr-m text-sm text-white/[.63]'>{lang.defaultAll}</p>
							</div>
							<div className='w-full h-px bg-white/[.37]' />
						</div>
						<div onClick={(e) => update({ cinematic: !data.cinematic })} className='w-[9.9375rem] h-[2.75rem] relative flex flex-col items-center select-none cursor-pointer group'>
							<div className='w-full h-px bg-[#C7FFCD]/[.37]' />
							<div className='w-[9.0625rem] group-hover:w-full h-full bg-[#C7FFCD]/[.04] group-hover:bg-[#C7FFCD]/5 flex items-center justify-center gap-x-[.3038rem] transition-all duration-500'>
								<p className='font-gr-m text-sm text-[#C7FFCD]/[.63]'>{lang.cinematicMode}</p>
							</div>
							<div className='w-full h-px bg-[#C7FFCD]/[.37]' />
						</div>
						<div onClick={(e) => setIsInMove(true)} className='w-[9.9375rem] h-[2.75rem] relative flex flex-col items-center select-none cursor-pointer group'>
							<div className='w-full h-px bg-[#C7D0FF]/[.37]' />
							<div className='w-[9.0625rem] group-hover:w-full h-full bg-[#C7D0FF]/[.04] group-hover:bg-[#C7D0FF]/5 flex items-center justify-center gap-x-[.3038rem] transition-all duration-500'>
								<MoveIt />
								<p className='font-gr-m text-sm text-[#C7D0FF]/[.63]'>{lang.moveIt}</p>
							</div>
							<div className='w-full h-px bg-[#C7D0FF]/[.37]' />
						</div>
					</m.div>
				</>
			)}
		</m.div>
	);
}

const Item = ({ setActivePage, activePage, menu }) => {
	const { update, data } = useData();
	return (
		<div className='relative w-full'>
			<div
				onClick={(e) => menu.type == 'page' && setActivePage(menu.id)}
				className='w-full h-[3.625rem] bg-white/[.07] rounded-md pl-[.6875rem] flex items-center justify-between select-none cursor-pointer'
			>
				<div className='flex items-center gap-x-3'>
					<div className='w-9 h-9 rounded-sm border border-white/[.15] bg-white/10 flex items-center justify-center'>{menu.icon}</div>
					<p className='text-[1.2321rem] text-white/[.66] font-gr-m'>{menu.label}</p>
				</div>

				{menu.type == 'page' ? (
					<PageItem activePage={activePage} menu={menu} />
				) : menu.type == 'select' ? (
					<SelectItem menu={menu} />
				) : (
					<div className='mr-[1.1875rem]'>
						<Range onChange={(e) => update({ [menu.id]: e.target.value })} value={data[menu.id] ?? 0} />
					</div>
				)}
			</div>

			<AnimatePresence>
				{menu.id == activePage && (
					<m.div className='absolute right-0 top-[1.125rem]' initial={{ opacity: 0, x: 5 }} animate={{ opacity: 1, x: 7.5 }} exit={{ opacity: 0, x: 5 }} transition={{ type: 'tween' }}>
						<Arrow />
					</m.div>
				)}
			</AnimatePresence>
		</div>
	);
};
const PageItem = ({ activePage, menu }) => {
	const { lang } = useLang();
	return (
		<div
			className={classNames('w-[11rem] h-full rounded-md !rounded-l-none bg-white/[.07] flex items-center justify-center transition-colors duration-300', {
				'!bg-white': activePage == menu.id,
			})}
		>
			<p
				className={classNames('text-white/60 font-gr-sb transition-colors duration-300', {
					'!text-black': activePage == menu.id,
				})}
			>
				{lang.choose}
			</p>
		</div>
	);
};

const SelectItem = ({ menu }) => {
	const { data, update } = useData();
	return (
		<div className='flex items-center gap-x-[.5625rem] mr-[1.1875rem]'>
			<div
				onClick={(e) => {
					update({ [menu.id]: menu.on.value });
					if (menu.id == 'mapType' || menu.id == 'mapVisibility') fetchNui('updateMap', menu.on.value);
				}}
				className={classNames('px-5 py-2 rounded-sm bg-white/[.12] text-white/[.43] font-gr-sb text-xs transition-colors duration-300', {
					'!bg-white !text-black': data[menu.id] == menu.on.value,
				})}
			>
				{menu.on.label}
			</div>
			<div
				onClick={(e) => {
					update({ [menu.id]: menu.off.value });
					if (menu.id == 'mapType' || menu.id == 'mapVisibility') fetchNui('updateMap', menu.off.value);
				}}
				className={classNames('px-5 py-2 rounded-sm bg-white/[.12] text-white/[.43] font-gr-sb text-xs transition-colors duration-300', {
					'!bg-white !text-black': data[menu.id] == menu.off.value,
				})}
			>
				{menu.off.label}
			</div>
		</div>
	);
};
