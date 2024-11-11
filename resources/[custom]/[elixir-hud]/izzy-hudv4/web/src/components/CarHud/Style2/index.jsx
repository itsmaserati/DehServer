import React from 'react';
import Fuel from './Fuel';
import SpeedoMeter from './SpeedoMeter';
import { ABS, Engine, Headlights, LeftSignal, RightSignal, Seatbelt } from 'components/Icons';

export default function Style2({ vehicleData }) {
	return (
		<div className='relative'>
			<Fuel value={vehicleData.fuel} />
			<SpeedoMeter vehicleData={vehicleData} />
			<div className='absolute bottom-1.5 left-1/2 -translate-x-1/2 flex flex-col items-center'>
				<div className='flex justify-center items-center gap-x-1.5'>
					<LeftSignal active={vehicleData.leftSignal} />
					<RightSignal active={vehicleData.rightSignal} />
				</div>
				<div className='flex justify-center items-center gap-x-4'>
					<Seatbelt active={vehicleData.seatbelt} />
					<Engine active={vehicleData.engine} />
				</div>
				<div className='flex justify-center items-center gap-x-7'>
					<Headlights active={vehicleData.headlights} />
					<ABS active={vehicleData.abs} />
				</div>
			</div>
		</div>
	);
}
