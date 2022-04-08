import asyncio
from typing import Optional

import aiojobs
from aiohttp import web
import json
import os


async def init():

    app = web.Application()
    app.router.add_get('/', hendler)

    return app


async def hendler(request):
    response_obj = {'status': 'success'}
    return web.Response(text=json.dumps(response_obj), status=200)



if __name__ == '__main__':

    web.run_app(init())

