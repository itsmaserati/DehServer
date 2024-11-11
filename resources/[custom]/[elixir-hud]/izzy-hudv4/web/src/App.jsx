import { useEffect, useState } from 'react';
import { useNuiEvent } from './hooks/useNuiEvent';
import Status from 'components/Status';
import TopInfos from 'components/TopInfos';
import CarHud from 'components/CarHud';
import { AnimatePresence, motion as m } from 'framer-motion';
import Settings from 'components/Settings';
import { fetchNui } from 'utils/fetchNui';
import Notification from 'components/Notification';
import classNames from 'classnames';
import { useData } from 'contexts/DataContext';

function App() {
	const [visibility, setVisibility] = useState(true);
	const [display, setDisplay] = useState(false);
	const [settingsDisplay, setSettingsDisplay] = useState(false);
	const [isInMove, setIsInMove] = useState(false);
	const { cinematic } = useData();
	useNuiEvent('HandleDisplay', setDisplay);
	useNuiEvent('HandleSettingsDisplay', setSettingsDisplay);
	useNuiEvent('setVisibility', setVisibility);

	const keydown = (e) => {
		if (e.key == 'Escape') {
			setIsInMove((prev) => {
				if (prev == false) {
					fetchNui('close');
				}
				return false;
			});
		}
	};

	useEffect(() => {
		window.addEventListener('keydown', keydown);
		return () => window.removeEventListener('keydown', keydown);
	}, []);
	return (
		<>
			{display && (
				<div
					className={classNames('w-full h-screen m-0 overflow-hidden opacity-100 transition-opacity', {
						'!opacity-0': !visibility,
					})}
				>
					<AnimatePresence>
						{cinematic && (
							<div className='absolute left-0 top-0 w-full h-full overflow-hidden'>
								<m.div
									initial={{ opacity: 0, y: '-100%' }}
									animate={{ opacity: 1, y: 0 }}
									exit={{ opacity: 0, y: '-100%' }}
									transition={{ duration: 0.6 }}
									className='absolute top-0 w-full h-[10%] bg-black'
								/>
								<m.div
									initial={{ opacity: 0, y: '100%' }}
									animate={{ opacity: 1, y: 0 }}
									exit={{ opacity: 0, y: '100%' }}
									transition={{ duration: 0.6 }}
									className='absolute bottom-0 w-full h-[10%] bg-black'
								/>
							</div>
						)}
					</AnimatePresence>

					{!cinematic && (
						<div className='absolute left-0 top-0 w-full h-full overflow-hidden'>
							<Status isInMove={isInMove} />
							<TopInfos isInMove={isInMove} />
							<CarHud isInMove={isInMove} />
							<Notification />
						</div>
					)}
					<AnimatePresence>{settingsDisplay && <Settings isInMove={isInMove} setIsInMove={setIsInMove} />}</AnimatePresence>
				</div>
			)}
		</>
	);
}

export default App;
