import React from 'react';
import Nitro from './Nitro';
import { ABS, Engine, Headlights, LeftSignal, RightSignal, Seatbelt } from 'components/Icons';
import TopInfos from './TopInfos';
import Fuel from './Fuel';
import SpeedoMeter from './SpeedoMeter';
import BottomInfos from './BottomInfos';

export default function Style1({ vehicleData }) {
	return (
		<div className='flex relative top-4'>
			<Nitro value={vehicleData.nitrous} />
			<div className='mt-[4.25rem] flex flex-col gap-y-3.5'>
				<LeftSignal active={vehicleData.leftSignal} />
				<Headlights active={vehicleData.headlights} />
				<Seatbelt active={vehicleData.seatbelt} />
			</div>
			<div className='ml-[.4269rem] flex flex-col items-center'>
				<TopInfos />
				<SpeedoMeter vehicleData={vehicleData} />
				<BottomInfos />
			</div>
			<div className='mt-[4.25rem] flex flex-col gap-y-3.5'>
				<RightSignal active={vehicleData.rightSignal} />
				<ABS active={vehicleData.abs} />
				<Engine active={vehicleData.engine} />
			</div>
			<Fuel value={vehicleData.fuel} />
		</div>
	);
}
